import 'package:get/get.dart';
import 'package:my_blog/component/api_constant.dart';
import 'package:my_blog/models/article_model.dart';
import 'package:my_blog/services/dio_service.dart';

class ListArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList();

  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getList();
  }

  Future<void> getList() async {
    loading.value = true;

    var response = await DioService().getMethod(ApiYrlConstant.getArticleList);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      loading.value = false;
    }
  }

  Future<void> getArticleListWithTagsId(String id  ) async {
    articleList.clear();
    loading.value = true;

    var response = await DioService().getMethod('${ApiYrlConstant.baseUrl}article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=');
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      loading.value = false;
    }
  }
}
