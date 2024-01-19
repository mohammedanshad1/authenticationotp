import 'package:authenticationotp/Api4/controller/datacontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/modelcontroller.dart';

void main() {
  runApp(MaterialApp(
    home: homepage(),
  ));
}

class homepage extends StatelessWidget {
  ///1:create instance for controller
  final controllers = Get.put(modelcontroller());

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
          var data = controllers.Modeldata.value;

          ///4:display data
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(data.name??""),
              Text(data.email??""),
              Text(data.profession??""),



            ],
          );
        }),
      ),
    );
  }
}
