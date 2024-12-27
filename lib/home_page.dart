import 'package:flutter/material.dart';
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
  @override
  Widget build(context) {

    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text('TO DO APP'),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.yellow[800],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add)
        ),
      body: ListView.builder(
        itemCount: TodoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
              taskName: TodoList[index][0],
              taskCompleted: TodoList[index][1],
              onChanged: (value) => checkBoxChanged(value,index)
              );
        },
      ),
    );
  }
}
