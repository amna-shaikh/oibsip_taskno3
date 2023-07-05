import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:internship/data/database.dart';
import 'package:internship/utils/todo_tile.dart';
import 'package:internship/utils/updatetask.dart';
import '../utils/showDialogue.dart';
import 'loginpage.dart';
class TodoScreen extends StatefulWidget {
   TodoScreen({Key? key}) : super(key: key);
  @override
  State<TodoScreen> createState() => _TodoScreenState();
}
class _TodoScreenState extends State<TodoScreen> {
  final _Box = Hive.box("Box");
  TodoDatabase  db = TodoDatabase();
  @override
  void initState() {
    if(_Box.get("TODOLIST") == null ){
      db.CreateInitialData();
    }
    else {
      db.loadData();
    }
    super.initState();
  }
  TextEditingController controller = TextEditingController();
   int? indextile ;
  void checkboxChanged(int position){
    setState(() {
      db.TaskList[position][1] = !db.TaskList[position][1];
    });
    db.updateDatabase();
  }
  void createTask(){
   showDialog(context: context, builder: (context) {
    return ShowDialogue(
  taskcontroller: controller,
      onSave: SavedTask,
      onCancel:(){
        Navigator.of(context, rootNavigator: true).pop();
    },
    );
   });
  }
  void SavedTask(){

    setState(() {
      if(controller.text.isEmpty){
       WidgetsBinding.instance.addPostFrameCallback((_) {
          const snackBar = SnackBar(
          content: Text('Please fill the field'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });

      }
      else {
        db.TaskList.add([controller.text, false]);
        controller.clear();
        Navigator.of(context, rootNavigator: true).pop();
      /*  WidgetsBinding.instance.addPostFrameCallback((_) {

        });*/

      }
    });
    db.updateDatabase();
  }
  void deleteTaskcall(int position){
    setState(() {
   db.TaskList.removeAt(position);
    });
    db.updateDatabase();
  }
 /* void updatetask(){
     Future.delayed(Duration.zero,()
     {
       setState(() {
    //    var IndexTitle  =
       controller.text = db.TaskList[indextile!][0].toString();
     });
     showDialog(context: context, builder: (context) {
         return UpdateDialogue(taskcontroller: controller,
             onupdate: onupdatetask,
             onCancel: () {
               Navigator.of(context, rootNavigator: true).pop();
         }
         );
       });
     });
  }*/
  void onupdatetask(){
    setState(() {
      db.TaskList[indextile!][0] = controller.text;
      controller.clear();
    });
    db.updateDatabase();
    Navigator.of(context, rootNavigator: true).pop();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text("Todo List" , style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.white
          ),),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext)=> loginpage()));
      },
                icon: Icon(Icons.logout ))
          ],
        ),
body: Column(
  children: [
    SizedBox(height: 5,),
    Text("Hi amna ", style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w600),),
        Expanded(
          child: ListView.builder(

    itemCount: db.TaskList.length,

            itemBuilder: (context, position) {

      return TodoTile(

          taskName: db.TaskList[position][0], istaskcomplete: db.TaskList[position][1], onChange: (value) =>

      checkboxChanged(position) , deleteTask: (context) => deleteTaskcall(position),

           UpdateTask: (){

             Future.delayed(Duration.zero,()

             {

               setState(() {

                indextile = position;

                 controller.text = db.TaskList[indextile!][0].toString();

               });

               showDialog(context: context, builder: (context) {

                 return UpdateDialogue(taskcontroller: controller,

                     onupdate: onupdatetask,

                     onCancel: () =>

                         Navigator.of(context, rootNavigator: true).pop()

                 );

               });

             });

           },

      );

    }),
        ),
  ],
),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
            onPressed: createTask,
          child:Icon(Icons.add , color: Colors.white,)
        ),

      ),
    );
  }
}
