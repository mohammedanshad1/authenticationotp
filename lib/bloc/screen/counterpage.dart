
import 'package:flutter/material.dart';

void main(){

  runApp(MaterialApp(home: counterapp(),));
}
class counterapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
 return Scaffold(
   appBar: AppBar(title: Text("Cubit Counter"),
   centerTitle: true,),
   body: Center(child: Column(children: [


     Text("Counter Value",style: TextStyle(fontSize: 40),)
   ],),
   ),
   floatingActionButton: Row(
     mainAxisAlignment: MainAxisAlignment.end,
     children: [
       FloatingActionButton(onPressed: (){},child: Icon(Icons.remove),
       ),
       SizedBox(width: 10,),
       FloatingActionButton(onPressed: (){},child: Icon(Icons.add),)
     ],

   ),
 );
  }



}