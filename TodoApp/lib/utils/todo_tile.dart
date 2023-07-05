import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
 final  String? taskName;
 final bool istaskcomplete ;
 final Function (bool?)? onChange;
final Function(BuildContext) deleteTask;
 final VoidCallback UpdateTask;
// final VoidCallback index;
  const TodoTile(
 //this.index,
      {required this.taskName , required this.istaskcomplete , required this.onChange , required this.deleteTask ,
    required this.UpdateTask
 });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only( left: 25 , right: 25 , top: 25),
    child:  Slidable(
      endActionPane: ActionPane(motion: StretchMotion(), children: [
        SlidableAction(onPressed: deleteTask , icon: Icons.delete,backgroundColor: Colors.deepOrange,)
      ]),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
            children: [
              Checkbox(value: istaskcomplete, onChanged: onChange , activeColor: Colors.black,) ,
              Expanded(
                child: Text(taskName! ,
                    softWrap: true,
                    style: TextStyle(
                    decoration: istaskcomplete ? TextDecoration.lineThrough : TextDecoration.none ,
                    fontSize: 20
                  ),),
              ),

           //   Expanded(child:
              SizedBox(width: 20,) ,
              //),

              IconButton(onPressed:
              UpdateTask,
              icon: Icon(Icons.edit))
            ],
          ),
        ),
      ),

    
    );
  }
}
