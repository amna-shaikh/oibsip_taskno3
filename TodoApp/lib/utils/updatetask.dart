import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internship/utils/buttons.dart';

class UpdateDialogue extends StatelessWidget {

  TextEditingController taskcontroller  = TextEditingController();
  VoidCallback onupdate;
  VoidCallback onCancel;
  UpdateDialogue({super.key,
    required this.taskcontroller,
    required this.onupdate,
    required this.onCancel,
  } );
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 150,
        child: Column(
          children: [TextField(
            maxLines: 2,
            controller: taskcontroller,
            decoration: InputDecoration(
                border: OutlineInputBorder(),),
          ),
            SizedBox(height: 10,),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonsClass(text: "Update", onPressed: onupdate,),
                  SizedBox(width: 20,),
                  ButtonsClass(text: "cancel", onPressed: onCancel)
                ],
              ),
            )



          ],
        ),
      ),


    );
  }
}