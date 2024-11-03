import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do/database.dart';
import 'package:to_do/dialog_box.dart';
import 'package:to_do/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ToDoDatabase db = ToDoDatabase();
  final _myBox = Hive.box('MyBox');

  void initState() {
    
  super.initState();

    if(_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    }
    else{
      db.loadData();
    }

  }


  void onChanged(bool? value , int index)
  {
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1];
    });

    db.updateData();
  }

  void savenewtask() {
    setState(() {
      db.todolist.add(
        [_controller.text,
        false]
      );
      _controller.clear();
      Navigator.of(context).pop();
    });
    db.updateData();
  }

  final _controller = TextEditingController();
  void addTask(){
    showDialog(
      context: context,
      builder: (context){
        return DialogBox(
          controller: _controller,
          savetask: savenewtask,
          cancel: () => Navigator.of(context).pop(),
          );
      }
    );
  }

  void deletetask(int index) {
    setState(() {
     db.todolist.removeAt(index);
    });
    db.updateData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Center(child: const Text('TO DO LIST')),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: addTask,
      ),
      body: ListView.builder(
        itemCount: db.todolist.length,
        itemBuilder: (context,index) {
          return ToDoList(
            taskname: db.todolist[index][0],
             isCompleted: db.todolist[index][1],
              onChanged: (value) => onChanged(value,index),
              onPressed: () => deletetask(index),
          );
        },
      )
    );

  }
}