import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog/component/my_componnent.dart';
import 'package:my_blog/controller/list_article_controller.dart';
import 'package:my_blog/controller/single_article_controller.dart';
import 'package:my_blog/view/singleArticlePage.dart';

// ignore: must_be_immutable
class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({super.key});

  ListArticleController listArticleController = Get.put(ListArticleController());
  SingleAticleController singleArticleController = Get.put(SingleAticleController());
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: appBar("مقالات جدید"),

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: Obx(
              () => ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: listArticleController.articleList.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      singleArticleController.id.value = int.parse(listArticleController.articleList[index].id.toString());
                      Get.to(() => SingleArticleInfo());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: Get.width / 3,
                    
                            height: Get.height / 6,
                            child: CachedNetworkImage(
                              imageUrl:
                                  listArticleController.articleList[index].image!,
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                              placeholder: (context, url) {
                                return Loading();
                              },
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
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: Get.width / 6,
                              
                                    child: Text(
                                      listArticleController
                                          .articleList[index]
                                          .author!,
                                      style: textTheme.titleSmall,
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Text(
                                    "${listArticleController.articleList[index].view!}بازدید",
                                    style: textTheme.titleSmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
