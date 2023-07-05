import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonsClass extends StatelessWidget {
 final String text;
 final VoidCallback onPressed;
  const ButtonsClass({required this.text , required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
     onPressed: onPressed ,
     child: Text(text , style: TextStyle(fontSize: 15),),
     color: Colors.black,
    textColor: Colors.white,

    );
  }
}
