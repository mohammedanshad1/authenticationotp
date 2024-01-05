import 'package:dio/dio.dart';

class DioService{


  Future<dynamic> getData(String url) async{


    Dio dio=Dio(); ///object creating

        return await dio  ///calling dio
            .get(url,
        options:Options(responseType:ResponseType.json,method: "GET" ))
    .then((response){
      return response;


    });
  }
}