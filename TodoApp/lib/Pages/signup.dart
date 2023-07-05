
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internship/Pages/TodoScreen.dart';

import 'loginpage.dart';


class signUpPage extends StatelessWidget {
  TextEditingController usercontroller = TextEditingController();

  TextEditingController passcontroller = TextEditingController();



  @override

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black87,
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const  Padding(
              padding: EdgeInsets.symmetric(vertical: 40 , horizontal: 20),
              child: Text("Welcome" , style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
              ),),
            ),
            const  SizedBox(height: 5,),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
              child: Text("Create Account",  style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white
              ),),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                controller: usercontroller,
                decoration:const InputDecoration(
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.white),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintText: 'Enter Your name',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    )
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Name';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                textCapitalization: TextCapitalization.sentences,
                controller:passcontroller ,
                obscureText: true,
                decoration: const InputDecoration(
                    focusColor: Colors.yellow,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.white),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintText: 'Enter Password',
                    hintStyle:TextStyle(
                      color: Colors.white,
                    )
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  }
                  else if(value.length < 6){
                    return "password length must be 6";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 10,),
            Padding(padding: const EdgeInsets.symmetric(vertical: 12 , horizontal: 50),

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    elevation: 0.0,
                    fixedSize: const Size(350, 50)
                ),
                onPressed: ()  {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TodoScreen()));
                }, child: const Text("Create Account" , style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
              ),),),


            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have account?", style: TextStyle(
                    fontSize: 15 ,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey
                )),
                TextButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  loginpage()));
                }, child:const Text("Login", style: TextStyle(
                    fontSize: 15 ,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue
                )), )
              ],
            ),
          ],
        ),
      ),
    );
  }
}