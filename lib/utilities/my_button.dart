import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const MyButton({super.key,
  required this.text,
  required this.onPressed
  });
  @override
  Widget build(context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return MaterialButton(
      
      onPressed:onPressed ,
      color: isDarkMode ? Color.fromARGB(227, 22, 41, 55) : Colors.grey[400],
      child: Text(text, 
      style:TextStyle(
        color: isDarkMode ?  Colors.white : Colors.black
      ),
      ),
    );
  }
}
