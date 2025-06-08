import 'package:hive_flutter/hive_flutter.dart';

class toDoDataBase{

  List toDoList = [];
  //reference  the box
  final _myBox = Hive.box('myBox');

  //run this method first time lopening this app
  void createInitialData(){
    toDoList = [
      ["Make Tutorials", false],
      ["Do Exercise", false],
    ];
  }
  //load data from db
  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }

  //update db
  void updatedb(){
    _myBox.put("TODOLIST", toDoList);
  }
}