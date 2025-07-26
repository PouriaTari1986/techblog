import 'dart:developer';
import 'package:dio/dio.dart' as dio_service;
import 'package:dio/dio.dart' ;

class DioService {
  Dio dio =Dio();
   Future<dio_service.Response> getMethod(String url) async {
 

    dio.options.headers['content-Type'] = 'application/json';

    return await dio
        .get(
          url,
          options: Options(responseType: ResponseType.json, method: 'GET'),
        )
        .then((response) {

          log(response.toString());
          return response;
        });
  }

Future<dynamic> postMethod(Map<String,dynamic> map,String url) async{

 

  return await dio.post(url,
  data: dio_service.FormData.fromMap(map),
  options: Options(
    responseType: ResponseType.json,
    method: 'POST',

  )).then((onValue){

    log(onValue.headers.toString());
    log(onValue.data.toString());
    log(onValue.statusCode.toString());
    return onValue;
  });


}

}
