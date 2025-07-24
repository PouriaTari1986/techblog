import 'dart:developer';

import 'package:get/get.dart';
import 'package:my_blog/models/article_info_model.dart';
import 'package:my_blog/services/dio_service.dart';

class SingleArticleController extends GetxController {
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;


  RxBool loading = false.obs;
  RxInt id = RxInt(0);

  @override
  void onInit() {
    super.onInit();
   getArticleInfo();
  }

  Future<void> getArticleInfo() async {
    loading.value = true;
    var useID = '';

    var response = await DioService().getMethod("https://techblog.sasansafari.com/Techblog/api/article/get.php?command=info&id=${id.value}&user_id=$useID");



    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data['info']);
    }else {
      log( "Error fetching article info: ${response.statusCode}");
    }
  }
}
