



import 'package:get/get.dart';
import 'package:my_blog/component/api_constant.dart';
import 'package:my_blog/models/article_info_model.dart';
import 'package:my_blog/services/dio_service.dart';

class SingleAticleController extends GetxController{




RxBool loading = false.obs;
RxInt id = RxInt(0);
Rxn<ArticleInfoModel> articleInfoModel = Rxn<ArticleInfoModel>();




  @override
  void onInit(){

    super.onInit();
    getArticleInfo();
  }




 Future<void> getArticleInfo()async{
  loading.value = true;

  // ignore: unused_local_variable
  var userId = '';
  var response = await DioService().getMethod('${ApiConstant.baseUrl}article/get.php?command=info&id=${id.value}&user_id=$userId');

 if(response.statusCode==200){

      articleInfoModel.value = ArticleInfoModel.jason(response.data);
       
      
 }

     

      loading.value = false;
    }
 }

