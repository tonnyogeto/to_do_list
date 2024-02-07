
import 'package:hive-flutter/hive_flutter.dart';


class ToDoDataBase{

  List toDoList=[];

  //refernce our box
  final _myBox = Hive.openBox('mybox');

  //run this method if this is the first time ever opening this app
  toDoList=[
    ["Make Tutoria",false],
    ["Do Exercise", false],
  ];

  //load the data from the database 
  void load(){
    toDoList=_myBox("TODOLIST");
  }

  //update the database
  void updateDateBase(){
    _myBox.put("TODOLIST", toDoList);

  }

}