import 'package:flutter/material.dart';
import 'package:myapp/utilities/dialog_box.dart';
import 'package:myapp/utilities/todo_tile.dart';
import 'package:myapp/utilities/shared_preferences_service.dart'; // Import SharedPreferences service

class HomePage extends StatefulWidget {
  final VoidCallback toggleTheme;

  const HomePage({super.key, required this.toggleTheme});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List<Map<String, dynamic>> TodoList = [];

  final _Controller1 = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTodoList(); 
  }

  
  Future<void> _loadTodoList() async {
    List<Map<String, dynamic>> loadedTodoList = await SharedPreferencesService.loadTodoList();

    
    if (loadedTodoList.isEmpty) {
      setState(() {
        TodoList = [
          {'title': 'Study Flutter', 'completed': false},
          {'title': 'Exercise', 'completed': false},
          {'title': 'Read Books', 'completed': false},
        ];
      });
      _saveTodoList(); 
    } else {
      setState(() {
        TodoList = loadedTodoList;
      });
    }
  }

  
  Future<void> _saveTodoList() async {
    await SharedPreferencesService.saveTodoList(TodoList);
  }

  
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      TodoList[index]['completed'] = !TodoList[index]['completed'];
    });
    _saveTodoList(); 
  }

  void saveNewTask() {
    if (_Controller1.text.isNotEmpty) {
      setState(() {
        TodoList.insert(0, {
          'title': _Controller1.text, 
          'completed': false, 
        });
        _Controller1.clear(); 
      });
      _saveTodoList(); 
      Navigator.of(context).pop(); 
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Task cannot be empty")),
      );
    }
  }

  
  void createNewtask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller1: _Controller1,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  
  void deleteTask(int index) {
    setState(() {
      TodoList.removeAt(index);
    });
    _saveTodoList(); 
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('TO-DO APP'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.brightness_6 : Icons.brightness_2),
            onPressed: widget.toggleTheme,
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.api),
          onPressed: () {
            Navigator.pushNamed(context, '/api-posts');
          },
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: createNewtask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 12.0),
        itemCount: TodoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: TodoList[index]['title'], 
            taskCompleted: TodoList[index]['completed'], 
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
