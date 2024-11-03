import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

class ToDoDatabase{

  List todolist = [];
  final _mybox = Hive.box('MyBox');

  void createInitialData() {
    todolist = [
    ["Complete the app",false],
    ["complete desi",false],
     ["Complete the app",false],
    ["complete desi",false],
  ];
  }

  void loadData() {
    todolist = _mybox.get('TODOLIST');
  }

  void updateData() {
    _mybox.put('TODOLIST', todolist);
  }

}