import 'dart:convert';

import 'package:authenticationotp/Api4/model/datamodel.dart';
import 'package:http/http.dart' as http;

import '../model/model.dart';

class httpservice {
  ///1:Get url

  var urls = "https://fluttmac.github.io/api/user.json";

  ///2:create get function

  Future<modeldata?> fetchdatas() async {
    var response = await http.get(Uri.parse(urls));

    ///3: check condition
    if (response.statusCode == 200) {
      ///4:json decode

      var data = await json.decode(response.body);
      return modeldata.fromJson(data);
    } else {
      return null;
    }
  }
}
