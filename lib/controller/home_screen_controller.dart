

import 'package:get/get.dart';
import 'package:my_blog/component/api_constant.dart';
import 'package:my_blog/models/article_model.dart';
import 'package:my_blog/models/podcast_model.dart';
import 'package:my_blog/models/poster_model.dart';
import 'package:my_blog/models/tags_model.dart';
import 'package:my_blog/services/dio_service.dart';

class HomeScreenController extends GetxController{

Rx<PosterModel> poster = PosterModel().obs;

RxList<TagsModel> tagList = RxList();

RxList<ArticleModel> topVisitedList = RxList();

RxList<PodcastModel> topPodcast = RxList();
RxBool loading = false.obs;


  @override
  void onInit(){

    super.onInit();
    getHomeItems();
  }




 Future<void> getHomeItems()async{
  loading.value = true;
  var response = await DioService().getMethod(ApiUrlConstant.getHomeItems);

 if(response.statusCode==200){

     response.data['top_visited'].forEach((element) {
      topVisitedList.add(
        ArticleModel.fromJson(element)
      );
   });

     response.data['top_podcasts'].forEach((element) {
        topPodcast.add(
          PodcastModel.fromJson(element)
        );
     });response.data['tags'].forEach((element) {
        tagList.add(
          TagsModel.fromJson(element)
        );
     });
      poster.value = PosterModel.fromJson(response.data['poster']);

      loading.value = false;
    }
 }
 }