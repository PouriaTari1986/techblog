import 'package:my_blog/component/api_constant.dart';

class ArticleInfoModel {

String? id;
String? title;
String? content;
String? image;
String? catID;
String? catName;
String? author;
String? view;
String? status;
String? createdAt;
bool? isFavorite;


  ArticleInfoModel(

   
  );

ArticleInfoModel.fromJson(Map<String, dynamic> element) {


var info = element['info'];
id = info['id'];
title = info['title'];
content = info['content'];
image = ApiConstant.hostDlUrl + info['image'];
catID = info['cat_id'];
catName = info['cat_name'];
author = info['author'];
view = info['view'];
status = info['status'];
createdAt = info['created_at'];
isFavorite = element['isFavorite'];
}
}