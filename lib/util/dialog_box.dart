import 'package:flutter/material.dart';
import 'package:todo/util/myButton.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key, 
    required this.controller,
    required this.onSave,
    required this.onCancel,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          //get user input
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter new the task..." ,
              ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            
            //save button
            Mybutton(name: "Save" ,onPressed: onSave),
            const SizedBox(width: 12),

            //cancel button
            Mybutton(name: "Cancel" ,onPressed: onCancel ),

          ],)
        ],),
      ),
    );
  }
}