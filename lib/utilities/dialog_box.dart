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
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller1,
              decoration: const InputDecoration(
              border: OutlineInputBorder(), hintText: "Title"),
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
