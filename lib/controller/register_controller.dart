import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog/component/api_constant.dart';
import 'package:my_blog/component/constant/my_strings.dart';
import 'package:my_blog/component/constant/storage_const.dart';
import 'package:my_blog/gen/assets.gen.dart';
import 'package:my_blog/main.dart';
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
        box.write(StorageConst.token, response.data['token']);
        box.write(StorageConst.userId, response.data['user_id']);

        // ignore: prefer_interpolation_to_compose_strings
        debugPrint("read:::" + box.read(StorageConst.token));

        // ignore: prefer_interpolation_to_compose_strings
        debugPrint("{read:::" + box.read(StorageConst.userId));
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
    if (GetStorage().read(StorageConst.token) == null) {
      Get.to(RegisterIntro());
    } else {
      routeToWriteBottomSheet();
    }
  }

  void routeToWriteBottomSheet() {
    Get.bottomSheet(
      Container(
        height: Get.height / 2.2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(Assets.images.welcome.path, height: 60),
                  SizedBox(width: 12),
                  Text(
                    "دونسته هات رو با بقیه به اشتراک بگذار....",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                MyStrings.gigTech,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
             SizedBox(height: Get.height/8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    
                    onTap: () {
                      // debugPrint("go to writing article");
                      Get.toNamed(NamedRoute().managedArtice);
                    },
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          Assets.icons.writeArticle.image(
                            height: 40,
                            color: Colors.black,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "مدیریت مقاله ها",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      debugPrint("write podcast");
                    },
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          Assets.icons.writePodcastIcon.image(
                            height: 40,
                            color: Colors.black,
                          ),
                          SizedBox(width: 8),
                          Text(
                           "مدیریت پادکست ها",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
