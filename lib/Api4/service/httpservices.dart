import 'dart:convert';

import 'package:authenticationotp/Api4/model/datamodel.dart';
import 'package:http/http.dart' as http;

class httpservices {
  ///1:Get url

  var url = "https://fakestoreapi.com/products/1";

  ///2:create get function

  Future<datamodel?> fetchdata() async {
    var response = await http.get(Uri.parse(url));

    ///3: check condition
    if (response.statusCode == 200) {
      ///4:json decode

      var data = await json.decode(response.body);
      return datamodel.fromJson(data);
    } else {
      return null;
    }
  }
}
