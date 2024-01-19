import 'package:authenticationotp/Api4/controller/datacontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void main() {
  runApp(MaterialApp(
    home: homepage(),
  ));
}

class homepage extends StatelessWidget {
  ///1:create instance for controller
  final controller = Get.put(datacontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Getx "),
      ),
      body: Container(
        alignment: Alignment.center,

        ///2:cretae obx

        child: Obx(() {
          ///3:store data
          var data = controller.Datamodel.value;

          ///4:display data
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(data.category??""),
              Text(data.title??""),
              Text(data.price.toString()),
              Text(data.description??""),



            ],
          );
        }),
      ),
    );
  }
}
