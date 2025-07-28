import 'dart:developer';

import 'package:my_blog/component/api_constant.dart';
import 'package:get/get.dart';
import 'package:my_blog/models/article_info_model.dart';
import 'package:my_blog/models/article_model.dart';
import 'package:my_blog/models/tags_model.dart';

import 'package:my_blog/services/dio_service.dart';

class SingleArticleController extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel(
    null,
    null,
    null
  ).obs;
  RxList<TagsModel> tagList = RxList();
  RxList<ArticleModel> relatedList = RxList();


  // ignore: strict_top_level_inference
  Future<void> getArticleInfo(var id) async {
    articleInfoModel = ArticleInfoModel(
      null,
      null,
      null

    ).obs;
    loading.value = true;
    var userId = '';
    //TODO userId is in hard cord Mode

        log('${ApiUrlConstant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId');
       var response = await DioService().getMethod('${ApiUrlConstant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId');

    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);
      loading.value =false;
    } 
    tagList.clear();
    response.data['tags'].forEach((element){

        tagList.add(TagsModel.fromJson(element));
    });
    relatedList.clear();
      response.data['related'].forEach((element){

          relatedList.add(ArticleModel.fromJson(element));

      });
      
    }
  
}

