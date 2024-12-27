import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  
  @override
  final String taskName;
  final bool taskCompleted;
  Function (bool?)? onChanged;
  ToDoTile({ super.key, 
  required this.taskName, 
  required this.taskCompleted,
   required this.onChanged
   });
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.only(left:25, right: 25,top: 25,),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Checkbox(value: taskCompleted, onChanged: onChanged),
            Text(taskName,
            style: TextStyle(decoration: taskCompleted ?TextDecoration.lineThrough :TextDecoration.none ),),
          ],
        ),
        decoration: BoxDecoration(color: Colors.white,
        borderRadius: BorderRadius.circular(5.0)),
        
      ),
    );
  }
}
