import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget{
  final String taskname;
  final bool isCompleted;
  Function(bool?)? onChanged;
  void Function()? onPressed;


  ToDoList({
    super.key,
    required this.taskname,
    required this.isCompleted,
    required this.onChanged,
    required this.onPressed,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0,right: 10.9,top: 10.0),
      child: Container(
        
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:  Colors.blue,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
              value: isCompleted,
               onChanged: onChanged,
               activeColor: Colors.black,
               ),
            Center(child: Text(
              taskname,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                decoration: (isCompleted)? TextDecoration.lineThrough:TextDecoration.none,
                ),
            )
            ),
            
            MaterialButton(
              onPressed: onPressed,
              child: Icon(Icons.delete),
              ),
          ],
        )
        
      ),
    );
  }
}