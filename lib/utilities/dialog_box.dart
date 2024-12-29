import 'package:flutter/material.dart';
import 'package:myapp/utilities/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller1;
  //final controller2;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key, 
    required this.controller1, 
   
    required this.onSave,
    required this.onCancel
    });
  @override
  Widget build(context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return AlertDialog(
      backgroundColor: isDarkMode ? Color.fromARGB(232, 37, 156, 226) : Colors .yellow,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller1,
              decoration: InputDecoration(
              border: OutlineInputBorder( borderSide: BorderSide(color: Colors.black)), hintText: "Title"),
            ),
            
            Row(
              children: [
                MyButton(text: "save", onPressed: onSave),
                const SizedBox(width: 10),
                MyButton(text: "cancel", onPressed: onCancel)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
