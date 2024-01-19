import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../model1/modelclassexmple.dart';

void main(){


  runApp(MaterialApp(home: api(),));
}
class api extends StatefulWidget{
  @override
  State<api> createState() => _apiState();
}

class _apiState extends State<api> {

  Model model=Model( title: '',  description: '', category: '', image: '',id: null,price: null,rating: null);
  bool isLoading=true;

  void fetchdata()  async{



    var response=await http.get(Uri.parse("https://fakestoreapi.com/products"));
    var json=jsonDecode(response.body);
    setState(() {
      model=Model.fromJson(json);
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
    appBar: AppBar(title: Text("ShopNow"),
    actions:[ Icon(Icons.shopping_cart),]),

  body:isLoading?Center(child: CircularProgressIndicator(),):
  GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context,index){


    return
        Card(color: Colors.white,
          child: Column(children: [
            Text(model.title ![index]),
            Image(image: NetworkImage(model.image![index])),

            Text(model.description![index]),
            Text(model.category![index]),


          ],),
        );
  },itemCount: model.title!.length,)
  );
  }
}