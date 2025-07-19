

class HashTagModel{

String title;

HashTagModel({required this.title});

}
class BlogModel{

int id;
String imageUrl;
String writer;
String title;
String writerImageUrl;
String data;
String content;
String views;

BlogModel({
  required this.id,
  required this.imageUrl,
  required this.writer,
  required this.title,
  required this.writerImageUrl,
  required this.data,
  required this.content,
  required this.views
  });

}
class PodcastModel{

int id;
String imageUrl;
String title;

PodcastModel({
  required this.id,
  required this.imageUrl,
  required this.title
});

}