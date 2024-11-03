import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:to_do/button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final savetask;
  final cancel;
  DialogBox({super.key,required this.controller,required this.savetask,required this.cancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue,
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter task"
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonCustom(
                  data: 'save',
                  onPressed: savetask,
                ),

                ButtonCustom(
                  data: 'cancs',
                  onPressed: cancel,
                )
                
              ],
            )
          ],
        ),
      ),
    );
  }
}