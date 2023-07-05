import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internship/utils/buttons.dart';

class ShowDialogue extends StatelessWidget {

 TextEditingController taskcontroller  = TextEditingController();
 VoidCallback onSave;
 VoidCallback onCancel;
ShowDialogue({super.key,
  required this.taskcontroller,
  required this.onSave,
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
              border: OutlineInputBorder(),
              hintText: 'Add a new Task'
            ),
          ),
          SizedBox(height: 10,),
            Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ButtonsClass(text: "save", onPressed: onSave,),
              SizedBox(width: 20,),
              ButtonsClass(text: "cancel", onPressed: onCancel)
            ],
          )



          ],
        ),
      ),


    );
  }
}
