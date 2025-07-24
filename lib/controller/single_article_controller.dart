import 'package:my_blog/component/api_constant.dart';
import 'package:get/get.dart';
import 'package:my_blog/models/article_info_model.dart';

import 'package:my_blog/services/dio_service.dart';

class SingleArticleController extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;



  Future<void> getArticleInfo() async {
  
    loading.value = true;
    var userId = '';
       var response = await DioService().getMethod('${ApiConstant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId');

    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);
      loading.value =false;
    } 
    }
  }

