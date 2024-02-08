
import 'package:hive/hive.dart';


class ToDoDataBase{

  List toDoList=[];

  //refernce our box
  final _myBox = Hive.box('mybox');

  //run this method if this is the first time ever opening this app
  void createInitialData(){
    toDoList=[
      ["Make Tutoria",false],
      ["Do Exercise", false],
  ];
  }
  //load the data from the database 
  void loadData(){
    toDoList=_myBox.get("TODOLIST");
  }

  //update the database
  void updateDateBase(){
    _myBox.put("TODOLIST", toDoList);

  }

}