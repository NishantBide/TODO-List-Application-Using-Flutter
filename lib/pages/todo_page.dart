import 'package:flutter/material.dart';
import 'package:todo/util/dialog_box.dart';
import 'package:todo/util/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/database/db.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final _myBox = Hive.box('myBox');
  toDoDataBase db = toDoDataBase();

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
     if(_myBox.get("TODOLIST") == null){
      db.createInitialData();
     }else{
      db.loadData();
     }
    
  }

  final _controller = TextEditingController();
  //list of todo tasks
  

  //checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updatedb();
  }

  //save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([ _controller.text, false]);
      _controller.clear();
    });
    db.updatedb();
    Navigator.of(context).pop();
  }

  //create a new task
  void createNewTask(){
    showDialog(
    context: context, 
      builder: (context) {
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),
        );
      },
    );

  }

  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updatedb();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('To-Do'),
        elevation: 0,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow , ),
        body: ListView.builder(
        itemCount:db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskname: db.toDoList[index][0], 
            iscomplete: db.toDoList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTask: (context) => deleteTask(index),
          );
        },
      )
    );
  }
}