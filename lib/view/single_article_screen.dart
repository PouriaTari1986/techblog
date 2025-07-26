import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:my_blog/component/my_colors.dart';
import 'package:my_blog/component/my_componnent.dart';
import 'package:my_blog/component/my_strings.dart';
import 'package:my_blog/controller/list_article_controller.dart';
import 'package:my_blog/controller/single_article_controller.dart';
import 'package:my_blog/gen/assets.gen.dart';
import 'package:my_blog/view/article_list_screen.dart';
import 'package:share_plus/share_plus.dart';

// ignore: must_be_immutable

// ignore: must_be_immutable
class SingleArticleScreen extends StatelessWidget {


  ListArticleController listArticleController = Get.put(ListArticleController());
  var singleArticleController = Get.find<SingleArticleController>();

  SingleArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Obx(
            () => singleArticleController.articleInfoModel.value.image == null
                ? SizedBox(height: Get.height, child: Loading())
                : Column(
                    children: [
                      Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: singleArticleController
                                .articleInfoModel
                                .value
                                .image!,
                            imageBuilder: ((context, imageProvider) =>
                                Image(image: imageProvider)),

                            placeholder: (context, url) =>
                                Loading(),
                            errorWidget: (context, url, error) =>
                                Assets.images.singlePlaceHolder.image(),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            left: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: GradiantColors.singleAppBarGradiant,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(width: 12),
                                  InkWell(
                                    onTap: () => Get.to(ArticleListScreen()),
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Icon(
                                    Icons.bookmark_outline_rounded,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  SizedBox(width: 12),
                                  InkWell(
                                    onTap: () async=> await SharePlus.instance.share(
                                      ShareParams(text: "لذت ببرید")
                                    ),
                                    child: InkWell(
                                      onTap: ()async=>await SharePlus.instance.share(ShareParams(
                                        text: MyStrings.shareText
                                      )),
                                      child: Icon(
                                        Icons.share,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              singleArticleController
                                  .articleInfoModel
                                  .value
                                  .title!,
                              maxLines: 2,
                              style: textTheme.titleMedium,
                            ),
                          ),
                          SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Assets.images.avatar.image(height: 24),
                                SizedBox(width: 12),
                                Text(
                                  singleArticleController
                                      .articleInfoModel
                                      .value
                                      .author!,
                                  style: textTheme.titleSmall,
                                ),
                                SizedBox(width: 20),
                                Text(
                                  singleArticleController
                                      .articleInfoModel
                                      .value
                                      .createdAt!,
                                  style: textTheme.displaySmall,
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: HtmlWidget(
                              singleArticleController.articleInfoModel.value.content!,
                              textStyle: textTheme.titleSmall,
                              enableCaching: true,
                              onLoadingBuilder:
                                  (context, element, loadingProgress) =>
                                      Loading(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: tags(textTheme),
                      ),
                      SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, bottom: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 16,),
                            Text(
                              MyStrings.relatedArticles,
                              style: textTheme.headlineMedium,
                            ),
                          ],
                        ),
                      ),

                      similar(textTheme),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget similar(TextTheme textTheme) {
    return SizedBox(
      height: Get.height / 3.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: singleArticleController.relatedList.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              singleArticleController.getArticleInfo(
                singleArticleController.relatedList[index].id,
              );
              Get.to(SingleArticleScreen());
            },
            child: Padding(
              padding: EdgeInsets.only(right: index == 0 ? Get.width / 15 : 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: Get.height / 5.3,
                      width: Get.width / 2.4,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: singleArticleController
                                .relatedList[index]
                                .image!,
                            imageBuilder: (context, imageProvider) =>
                                Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                                image: DecorationImage(image:
                                 imageProvider,fit: BoxFit.cover)
                              ),
                              foregroundDecoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16)),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors:GradiantColors.blogPostGradiant
                                   )
                              ),
                            ),
                            placeholder: (context, url) => Loading(),
                            errorWidget: (context, url, error) => Center(
                              child: Icon(
                                Icons.image_not_supported_outlined,
                                color: Colors.grey,
                                size: 24,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  singleArticleController
                                      .relatedList[index]
                                      .author!,
                                  style: textTheme.displayLarge,
                                ),
                               
                                Row(
                                  children: [
                                    Text(
                                      singleArticleController
                                          .relatedList[index]
                                          .view!,
                                      style: textTheme.displayLarge,
                                    ),
                                     SizedBox(width: 8),
Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: SolidColors.hintText,
                                  size: 12,
                                ),
                                  ],
                                ),
                               
                                
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width/2.4,
                    child: Text(
                      singleArticleController.relatedList[index].title!,
                      style: textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget tags(TextTheme textTheme) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        itemCount: singleArticleController.tagList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () async {
              var tagId = singleArticleController.tagList[index].id;

              await Get.find<ListArticleController>().getArticleListWithTagsId(
                tagId!,
              );

              Get.to((ArticleListScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.only(left:12),
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  color: SolidColors.hintText,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    singleArticleController.tagList[index].title!,
                    style: textTheme.headlineSmall,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
