import 'package:authenticationotp/Api4/model/datamodel.dart';
import 'package:authenticationotp/Api4/service/httpservices.dart';
import 'package:get/get.dart';

class datacontroller extends GetxController {
  ///1:create instance variable
  var Datamodel = datamodel().obs;

  getdata() async {
    try {
      ///2:cretae instance of data service
      var data = await httpservices().fetchdata();

      ///3:check condition
      if (data != null) {
        Datamodel.value = data;
      }
    } catch (e) {
      Get.snackbar("title", "$e");
    }
  }

  ///4:call function
  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}