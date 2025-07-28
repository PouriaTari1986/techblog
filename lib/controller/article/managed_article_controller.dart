import 'dart:developer';

import 'package:dio/dio.dart'as dio;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog/component/api_constant.dart';
import 'package:my_blog/component/constant/command.dart';
import 'package:my_blog/component/constant/storage_const.dart';
import 'package:my_blog/controller/file_controller.dart';
import 'package:my_blog/models/article_info_model.dart';
import 'package:my_blog/models/article_model.dart';
import 'package:my_blog/models/tags_model.dart';
import 'package:my_blog/services/dio_service.dart';

class ManagedArticleController extends GetxController {


  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel(
    "اینجا عنوان مقاله قرار میگیره ، یه عنوان جذاب انتخاب کن",
    """من متن و بدنه اصلی مقاله هستم ، اگه میخوای من رو ویرایش کنی و یه مقاله جذاب بنویسی ، نوشته آبی رنگ بالا که نوشته "ویرایش متن اصلی مقاله" رو با انگشتت لمس کن تا وارد ویرایشگر بشی""",
    ""
  ).obs;
  RxList<ArticleModel> articleList = RxList.empty();
  RxList<TagsModel> tagList = RxList.empty();
  TextEditingController titleEditingController = TextEditingController();

RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getManagedArticle();
  }

  void getManagedArticle() async {

    loading = true.obs;
    var response = await DioService().getMethod(
      ApiUrlConstant.publisheArticle + GetStorage().read(StorageConst.userId));
     

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      loading = false.obs;
    }
  }

void updateTitle(){

  articleInfoModel.update((val){

    val!.title = titleEditingController.text;
  });
}

Future<void> storeArticle() async {
var fileController = Get.find<FilePickerController>();

loading.value= true;
Map<String,dynamic> map = {

ApiKeyArticleConstant.title: articleInfoModel.value.title,

ApiKeyArticleConstant.content: articleInfoModel.value.content,

ApiKeyArticleConstant.catID: articleInfoModel.value.catId,

ApiKeyArticleConstant.userId: GetStorage().read(StorageConst.userId),

ApiKeyArticleConstant.image: await dio.MultipartFile.fromFile(fileController.file.value.path!),

ApiKeyArticleConstant.command: Command.store,
ApiKeyArticleConstant.tagList: "[]",

};
var respose = await DioService().postMethod(map, ApiUrlConstant.storeArticle);

log(respose.data.toString());
  loading.value = false;
}

}
