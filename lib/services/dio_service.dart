import 'dart:developer';
import 'package:dio/dio.dart' as dio_service;
import 'package:dio/dio.dart' ;

class DioService {
  Dio dio =Dio();
   Future<dynamic> getMethod(String url) async {
 

    dio.options.headers['content-Type'] = 'application/json';

    return await dio
        .get(
          url,
          options: Options(responseType: ResponseType.json, method: 'GET'),
        )
        .then((response) {

          log(response.toString());
          return response;
        }).catchError((err){

          if(err is DioException){
            return err.response!;
          }
          return err;
        });
  }

Future<dynamic> postMethod(Map<String,dynamic> map,String url) async{

 

  return await dio.post(url,
  data: dio_service.FormData.fromMap(map),
  options: Options(
    responseType: ResponseType.json,
    method: 'POST',

  )).then((response){

    log(response.headers.toString());
    log(response.data.toString());
    log(response.statusCode.toString());
    return response;
  }).catchError((err){

    if(err is DioException){

      return err.response!;
    }
    return err;
  });


}

}
