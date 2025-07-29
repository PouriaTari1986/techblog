
import 'package:my_blog/component/api_constant.dart';

class PodcastFileModel {

String? id;
String? podcastId;
String? file;
String? title;
String? length;



PodcastFileModel();

PodcastFileModel.fromJson(Map<String,dynamic>element){

 id = element["id"];
 podcastId = element["podcast_id"];
 file =ApiUrlConstant.hostDlUrl + element["file"];
 title = element["title"];
 length = element["length"];

}
}