import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../modelclass/users.dart';


void main(){


  runApp(MaterialApp(home: home20(),));
}
class home20 extends StatefulWidget{
  @override
  State<home20> createState() => _home20State();
}

class _home20State extends State<home20> {
  User use=User(data: []);
  bool isLoading=true;

  void fetchdata() async{

   var response=await http.get(Uri.parse("https://fluttmac.github.io/api/user.json"));
    var json=jsonDecode(response.body);
    setState(() {
      use=User.fromJson(json);
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
   appBar: AppBar(title: Text("API"),),

      body:ListView.builder(itemBuilder: (context,index){


        return
            Column(children: [

              Container(decoration: BoxDecoration(color: Colors.red,
                  borderRadius: BorderRadius.circular(30)),
              child: Text(use.data![index].name!),),

              Container(decoration: BoxDecoration(color: Colors.green,
                  borderRadius: BorderRadius.circular(30)),
                child: Text(use.data![index].profession!),),



              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30)),
                child: Text(use.data![index].email!),)
            ],);



      },itemCount: use.data!.length,)

    );
  }
}