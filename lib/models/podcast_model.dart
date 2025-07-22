import 'package:my_blog/component/api_constant.dart';

class PodcastModel {

String? id;
String? title;
String? poster;
String? catName;
String? view;
String? status;
String? createdAt;
String? author;

PodcastModel({
  required this.id,
  required this.title,
  required this.poster,
  required this.catName,
  required this.view,
  required this.status,
  required this.createdAt,
  required this.author,
});

PodcastModel.fromJson(Map<String, dynamic> element) {
  id = element['id'];
  title = element['title'];
  poster = ApiConstant.hostDlUrl + element['poster'];
  catName = element['cat_name'];
  view = element['view'];
  status = element['status'];
  createdAt = element['created_at'];
  author = element['author'];
}

}

