import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog/component/my_componnent.dart';
import 'package:my_blog/controller/list_article_controller.dart';
import 'package:my_blog/controller/single_article_controller.dart';
import 'package:my_blog/view/single_article_screen.dart';

// ignore: must_be_immutable
class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({super.key});

  ListArticleController listArticleController = Get.put(
    ListArticleController(), 
  );
 SingleArticleController singleArticleController = Get.put(SingleArticleController());
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: appBar("لیست مقاله ها"),

      body: Obx(
        () => ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: listArticleController.articleList.length,
          itemBuilder: (context, index) {
            return GestureDetector(

              onTap: () {
                singleArticleController.articleInfoModel.value.id = listArticleController.articleList[index].id;
                Get.to(SingleArticleScreen());
              },

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width / 4,
                      height: Get.height / 8,
                      child: CachedNetworkImage(
                        imageUrl: listArticleController.articleList[index].image!,
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      
                        placeholder: (context, url) => Loading(),
                        errorWidget: (context, url, error) => Icon(
                          Icons.image_not_supported_outlined,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Get.width / 2,
                          child: Text(
                            listArticleController.articleList[index].title!,
                            style: textTheme.titleMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              listArticleController.articleList[index].author!,
                              style: textTheme.displaySmall,
                            ),
                            SizedBox(width: 20),
                            Text(
                              "${listArticleController.articleList[index].view!}بازدید",
                              style: textTheme.displaySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
