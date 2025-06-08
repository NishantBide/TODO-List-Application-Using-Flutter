// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class TodoTile extends StatelessWidget {
  final taskname;
  final bool iscomplete;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;

  TodoTile({ 
    super.key,
    required this.taskname,
    required this.iscomplete,
    required this.onChanged,
    required this.deleteTask,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children:[ 
          SlidableAction(
            onPressed: deleteTask,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(12),       
          )
          ],
          ),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12)),
          child: Row(
          children: [
             //checkbox
             Checkbox(
             value: iscomplete, 
             onChanged: onChanged,
             activeColor: Colors.black,
             ),
        
        
            //taskname
            Text(
              taskname,
              style: TextStyle(
                decoration: iscomplete ? 
                TextDecoration.lineThrough :
                TextDecoration.none ),
            ),  
          ],
          ),
            ),
      ),
    );
  }
}


