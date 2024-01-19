import 'package:authenticationotp/email%20verification/databasefire.dart';
import 'package:authenticationotp/email%20verification/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async{ WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(

);
  runApp(MaterialApp(home: logns(),));
}

class logns extends StatefulWidget {
  @override
  State<logns> createState() => _lognsState();
}

class _lognsState extends State<logns> {
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  void signUpUser() async{

    firebase(FirebaseAuth.instance).signUpWithEmail(email: emailController.text, password: passwordController.text, context: context);
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>signin()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up"),),

      body:Column(children: [

        Center(child: Text("Register",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold,fontSize: 30),)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(controller: emailController,
            decoration: InputDecoration(border: OutlineInputBorder(),
          labelText: "Email"),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(controller: passwordController,
            decoration: InputDecoration(border: OutlineInputBorder(),
              labelText: "Password"),),
        ),
        ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
            onPressed: (){
          signUpUser();
            }, child: Text("Sign Up")),
        TextButton(onPressed:(){

          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>signin()));
        } , child: Text("Already Have an  Account"))

      ],),
    );
  }
}