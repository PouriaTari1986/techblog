

import 'package:get/get.dart';
import 'package:my_blog/component/api_constant.dart';
import 'package:my_blog/models/podcast_file_model.dart';
import 'package:my_blog/services/dio_service.dart';

class SinglePodcastController extends GetxController{

  var id;

SinglePodcastController({this.id});

RxBool loading = false.obs;


RxList<PodcastFileModel> podcastEpisodeList = RxList();



Future<void> getPodcastFiles() async {

loading.value = true;

var response = await DioService().getMethod(ApiUrlConstant.getPodcasts+id);

  if(response.statusCode==200){

    for (var element in response.data["files"]) {
      
      podcastEpisodeList.add(PodcastFileModel.fromJson(element));
    }
    loading.value = false;
  }


}

}