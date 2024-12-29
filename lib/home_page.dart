import 'package:flutter/material.dart';
import 'package:myapp/utilities/dialog_box.dart';
import 'package:myapp/utilities/todo_tile.dart';

class HomePage extends StatefulWidget {
  final VoidCallback toggleTheme;

  const HomePage({super.key, required this.toggleTheme});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List TodoList = [
    ["Study", true],
    ["Exercise", false],
    ["Code", false]
  ];

  final _Controller1 = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      TodoList[index][1] = !TodoList[index][1];
    });
  }

  void saveNewTask() {
    if (_Controller1.text.isNotEmpty) {
      setState(() {
       TodoList.insert(0, [_Controller1.text, false]);
        _Controller1.clear();
      });
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
        padding: const EdgeInsets.only(top:12.0),
        itemCount: TodoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: TodoList[index][0],
            taskCompleted: TodoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
