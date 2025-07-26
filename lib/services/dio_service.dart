import 'dart:developer';



import 'package:dio/dio.dart' as dio_service;

import 'package:dio/dio.dart' ;

class DioService {
  Dio dio = Dio();
   getMethod(String url) async {
 

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


  
 postMethod(Map<String , dynamic>map,String url,  )async{

    
 
  dio.options.headers['content-Type'] = 'application/json';

    return await dio.post(url,
     data: dio_service.FormData.fromMap(map),
     options: Options(
      responseType: ResponseType.json,
      method: 'POST'
     )
    
    ).then((sendingEmail){


      log(sendingEmail.headers.toString());

      log(sendingEmail.data.toString());

      log(sendingEmail.statusCode.toString());
      return sendingEmail;
    });
  }

  }

