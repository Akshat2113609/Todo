import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPreferencesService {
  static const String todoListKey = 'todoList';

  static Future<void> saveTodoList(List<Map<String, dynamic>> todoList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> encodedList = todoList.map((todo) => json.encode(todo)).toList();
    await prefs.setStringList(todoListKey, encodedList);
  }

  static Future<List<Map<String, dynamic>>> loadTodoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? encodedList = prefs.getStringList(todoListKey);

    if (encodedList == null) {
      return [];
    }

    return encodedList.map((item) => json.decode(item) as Map<String, dynamic>).toList();
  }
}
