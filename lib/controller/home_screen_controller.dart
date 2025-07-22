import 'package:get/get.dart';
import 'package:my_blog/component/api_constant.dart';
import 'package:my_blog/models/article_model.dart';
import 'package:my_blog/models/poster_model.dart';
import 'package:my_blog/models/tags_model.dart';
import 'package:my_blog/services/dio_service.dart';

class HomeScreenController extends GetxController{

late Rx<PosterModel> poster;

RxList<TagsModel> tagList = RxList();

RxList<ArticleModel> topVisitedList = RxList();

RxList<PosterModel> topPodcastList = RxList();

  @override
  void onInit(){

    super.onInit();
    getHomeItems();
  }


 Future<void> getHomeItems()async{

  var response = await DioService().getMethod(ApiConstant.getHomeItems);

 if(response.statusCode==200){

   response.data['top_visited'].forEach((element){

      topVisitedList.add(
        ArticleModel.fromJson(element)
      );

   });
 }
}

}