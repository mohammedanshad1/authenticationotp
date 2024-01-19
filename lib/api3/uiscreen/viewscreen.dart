import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../modlclass/newclass.dart';

void main(){

  runApp(MaterialApp(home:viewscreen() ,));
}
class viewscreen extends StatefulWidget{
  @override
  State<viewscreen> createState() => _viewscreenState();
}

class _viewscreenState extends State<viewscreen> {


New _new=New();
bool isLoading=true;
  void fetchdata() async{

    var response=await http.get(Uri.parse("https://fakestoreapi.com/users"));
    var json=jsonDecode(response.body);
    setState(() {

      _new=New.fromJson(json);
      isLoading=false;

    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(

    appBar: AppBar(title: Text("Home Page"),),

body:isLoading?Center(child:CircularProgressIndicator(),):
ListView.builder(itemBuilder: (context,index){
  
  
  return Container(
    child: Column(children: [
      
      Text(_new.email![index]),
      Text(_new.username![index]),
      Text(_new.password![index]),
      Text(_new.phone![index])



    ],),
  );
},itemCount: _new.email!.length,)

  );
  }
}