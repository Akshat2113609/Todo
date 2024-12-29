import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  const ToDoTile({
    Key? key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: isDarkMode ? Color.fromARGB(232, 37, 156, 226) : Colors.yellow[800], 
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          leading: Checkbox(
            value: taskCompleted,
            onChanged: onChanged,
            activeColor: Colors.white, 
            checkColor: isDarkMode ? Colors.blue : Colors.yellow[800], 
          ),
          title: Text(
            taskName,
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black, 
              decoration: taskCompleted ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              if (deleteFunction != null) {
                deleteFunction!(context);
              }
            },
          ),
        ),
      ),
    );
  }
}
