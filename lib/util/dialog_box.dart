import 'package:flutter/material.dart';
import 'package:todoapp/util/my_button.dart';

class dialog_box extends StatelessWidget {
  final controller;
  VoidCallback OnSave;
  VoidCallback OnCancel;
  dialog_box({super.key,
  required this.controller,
  required this.OnCancel,
  required this.OnSave,});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:Colors.yellow[300],
      content: Container(
      height: 120,
      child: Column(children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(border: OutlineInputBorder(),
          hintText:"Add a New Tesk" ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            my_button(text: "Save", onPressed:OnSave),
            const SizedBox(width:4),
            my_button(text: "Cancel", onPressed: OnCancel),
            
          ],
        )
      ]),
      )
    );
  }
}