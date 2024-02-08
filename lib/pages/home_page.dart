// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list/data/database.dart';
import 'package:to_do_list/util/dialog_box.dart';
import 'package:to_do_list/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final _myBox =Hive.box('mybox');
  ToDoDataBase db =ToDoDataBase();

  @override
  void initState() {

    // if this is the first time ever openning the app, then create default data
    if(_myBox.get("TODOLIST")==null){
      db.createInitialData();
    } else{
      //there already exists data
      db.loadData();
    }

    super.initState();
  }



  //text controller 
  final _controller = TextEditingController();


  //checkbox was tapped 
  void checkBoxChanged(bool? value, int index){
    setState(() {
      
      db.toDoList[index][1]= !db.toDoList[index][1];
    });

    db.updateDateBase();
  }

  //save new task
  void saveNewTask(){
    setState(() {
       db.toDoList.add([_controller.text, false ]);  
      _controller.clear();
    });

    Navigator.of(context).pop();
    db.updateDateBase();

  }

  //create a new task
  void createNewTask(){
    showDialog(
      context: context, 
      builder: (context){
        return DialogBox(
          controller:_controller,
          onSave: saveNewTask,
          onCancel: ()=> Navigator.of(context).pop(),
        );
      }
      );
  }

  //delete task
  void deleteTask(int index){
    setState(() {
       db.toDoList.removeAt(index);
    });
    db.updateDateBase();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text('TO DO'),
        elevation: 0,
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        ),
      body: ListView.builder(
        itemCount:  db.toDoList.length,
        itemBuilder: (context,index){
          return ToDoTile(
            taskName:  db.toDoList[index][0], 
            taskCompleted:  db.toDoList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context)=> deleteTask(index),
            );
        },
        
      ),
    );
  }
}
