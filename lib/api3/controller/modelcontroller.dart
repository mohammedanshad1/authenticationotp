import 'package:authenticationotp/Api4/model/datamodel.dart';
import 'package:authenticationotp/Api4/service/httpservices.dart';
import 'package:authenticationotp/api3/model/model.dart';
import 'package:get/get.dart';

import '../service/httpservice.dart';

class modelcontroller extends GetxController {
  ///1:create instance variable
  var Modeldata = modeldata().obs;

  getdata() async {
    try {
      ///2:cretae instance of http service
      var data = await httpservice().fetchdatas();

      ///3:check condition
      if (data != null) {
        Modeldata.value = data;
      }
    } catch (e) {
      Get.snackbar("name", "$e");
    }
  }

  ///4:call function
  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}