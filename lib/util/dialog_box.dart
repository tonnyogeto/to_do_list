import 'package:flutter/material.dart';
import 'package:to_do_list/util/my_button.dart';


class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,

    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get users input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText:"Add a new task"
                ),
             
            ),

            //button -> save+cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButton(text: "save", onPressed: onSave),

                const SizedBox(width: 8,),

                //cancel button
                MyButton(text: "cancel", onPressed: onCancel),
              ],
            )
          ],
        ),

      ),
    );
  }
}