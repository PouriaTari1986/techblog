import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog/component/api_constant.dart';
import 'package:my_blog/component/storage_const.dart';
import 'package:my_blog/services/dio_service.dart';
import 'package:my_blog/view/main_screen/main_screen.dart';
import 'package:my_blog/view/register/register_intro.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController activeCodeTextEditingController =
      TextEditingController();

  var email = "";
  var userId = "";

  Future<void> register() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': 'register',
    };

    var response = await DioService().postMethod(map, ApiConstant.postRegiter);

    email = emailTextEditingController.text;
    userId = response.data['user_id'];

    debugPrint(response.toString());
  }

  Future<void> verify() async {
    Map<String, dynamic> map = {
      'email': email,
      'command': 'verify',
      'user_id': userId,
      'code': activeCodeTextEditingController.text,
    };

    var response = await DioService().postMethod(map, ApiConstant.postRegiter);

    debugPrint(response.data.toString());

    var status = response.data['response'];

    switch (status) {
      case 'verified':
        var box = GetStorage();
        box.write(token, response.data['token']);
        box.write(userId, response.data['user_id']);

        // ignore: prefer_interpolation_to_compose_strings
        debugPrint("read:::" + box.read(token));

        // ignore: prefer_interpolation_to_compose_strings
        debugPrint("{read:::" + box.read(userId));
        Get.offAll((MainScreen()));
        break;
      case 'incorrect_code':
        Get.snackbar("خطا", "کد فعال سازی غلط است");

        break;
      case 'expired':
        Get.snackbar("خطا", "کد فعال سازی منقضی شده است");

        break;
    }
  }

  void toggleLogin() {
    if (GetStorage().read(token) == null) {
      Get.to(RegisterIntro());
    } else {
      debugPrint("post screen");
    }
  }
}
