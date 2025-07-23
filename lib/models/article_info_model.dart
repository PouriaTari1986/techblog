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

ArticleInfoModel({

 this.id,
 this.title,
 this.content,
 this.image,
 this.catID,
 this.catName,
 this.author,
 this.view,
 this.status,
 this.createdAt,
 this.isFavorite,

});

ArticleInfoModel.jason(Map<String, dynamic> element) {
var info = element['info'];
id = info['id'];
title = info['title'];
content = info['content'];
image = info['image'];
catID = info['cat_id'];
catName = info['cat_name'];
author = info['author'];
view = info['view'];
status = info['status'];
createdAt = info['created_at'];
isFavorite = element['isFavorite'];
}
}