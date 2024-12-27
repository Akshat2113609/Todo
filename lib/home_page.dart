import 'package:flutter/material.dart';
import 'package:myapp/utilities/dialog_box.dart';
import 'package:myapp/utilities/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List TodoList = [
    ["Study", true],
    ["Exercise", false],
    ["Code", false]
  ];
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      TodoList[index][1] = !TodoList[index][1];
    });
  }

  final _Controller1 = TextEditingController();
  // final _Controller2 = TextEditingController();
  void saveNewTask() {
    setState(() {
      TodoList.add([_Controller1.text, false]);
      _Controller1.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewtask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller1: _Controller1,
            // controller2: _Controller2,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('TO DO APP'),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.yellow[800],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: createNewtask, child: const Icon(Icons.add)),
      body: ListView.builder(
        itemCount: TodoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
              taskName: TodoList[index][0],
              taskCompleted: TodoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index));
        },
      ),
    );
  }
}
