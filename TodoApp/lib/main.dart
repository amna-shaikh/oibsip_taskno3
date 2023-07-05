import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:internship/Pages/loginpage.dart';
import 'Pages/TodoScreen.dart';

void main() async
{
  await Hive.initFlutter();
  var box =await Hive.openBox("Box");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:TodoScreen(),
    );
  }
}

