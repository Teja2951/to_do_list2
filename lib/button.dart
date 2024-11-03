import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final String data;
  VoidCallback onPressed;
  
  ButtonCustom({
    super.key,
    required this.data,
    required this.onPressed,
    });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(data)
      
    );
  }
}