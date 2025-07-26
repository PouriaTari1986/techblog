import 'package:get/get.dart';
import 'package:my_blog/controller/article/list_article_controller.dart';
import 'package:my_blog/controller/register_controller.dart';
import 'package:my_blog/controller/article/single_article_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ListArticleController());

    Get.lazyPut(() => SingleArticleController());
  }
}
class RegisteBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}
