import 'package:hive/hive.dart';

class TodoDatabase{
  List TaskList = [];
  final _Box = Hive.box("Box");


  void CreateInitialData(){
     TaskList = [
      ["Be Happy" , false],
      ["Do good Always" , false]
    ];
  }

  void loadData(){
    TaskList  = _Box.get("TODOLIST");
  }
  void updateDatabase(){
   _Box.put("TODOLIST", TaskList);
  }
}