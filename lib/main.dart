import 'package:flutter/material.dart';
import 'pages/todo_page.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async{
  //init the hive
  await Hive.initFlutter();

  var box = await Hive.openBox('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoPage(),
       theme: ThemeData(
    primarySwatch: Colors.yellow,
  ),
    );
  }
}
