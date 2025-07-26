
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_blog/component/api_constant.dart';
import 'package:my_blog/services/dio_service.dart';

class RegisterController extends GetxController {


  TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController activeCodeTextEditingController = TextEditingController();

  var email = "";
  var user_id = "";

Future<void> register()async{


  Map<String,dynamic> map={

    'email': emailTextEditingController.text,
    'command': 'register'
  };

 var response = await DioService().postMethod(map, ApiConstant.postRegiter);

 email= emailTextEditingController.text;
 user_id = response.data['user_id'];
  
 print(response);
}
Future<void> verify()async{


  Map<String,dynamic> map={

    'email': email,
    'command': 'verify',
    'user_id': user_id,
    'code' : activeCodeTextEditingController.text,

  };

 var response = await DioService().postMethod(map, ApiConstant.postRegiter);

 print(response.data);
}


}