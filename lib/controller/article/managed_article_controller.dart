import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog/component/api_constant.dart';
import 'package:my_blog/component/storage_const.dart';
import 'package:my_blog/models/article_model.dart';
import 'package:my_blog/services/dio_service.dart';

class ManagedArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList.empty();

RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getManagedArticle();
  }

  void getManagedArticle() async {

    loading = true.obs;
    var response = await DioService().getMethod(
      ApiConstant.publisheArticle + GetStorage().read(StorageConst.userId));
     

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      loading = false.obs;
    }
  }
}
