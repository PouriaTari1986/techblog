class PodcastModel {

String? id;
String? title;
String? poster;
String? publisher;
String? view;
String? status;
String? createdAt;
String? isFavorite;

PodcastModel({
  required this.id,
  required this.title,
  required this.poster,
  required this.publisher,
  required this.view,
  required this.status,
  required this.createdAt,
  required this.isFavorite,
});

PodcastModel.fromJson(Map<String, dynamic> element) {
  id = element['id'];
  title = element['title'];
  poster = element['poster'];
  publisher = element['publisher'];
  view = element['view'];
  status = element['status'];
  createdAt = element['created_at'];
  isFavorite = element['isFavorite'];
}

}

