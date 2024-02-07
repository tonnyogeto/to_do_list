// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
ToDoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Text("Make tutorial"),
        decoration: BoxDecoration(color: Colors.yellow),
    
      ),
    );
  }
}