import 'package:get/get.dart';
import 'package:my_blog/controller/article/list_article_controller.dart';
import 'package:my_blog/controller/article/managed_article_controller.dart';
import 'package:my_blog/controller/register_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {


    Get.lazyPut(()=> ListArticleController());

    

  }
}
class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}
class ArticleManagerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put( ManagedArticleController());
  }
}
