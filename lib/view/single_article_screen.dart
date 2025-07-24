import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:my_blog/component/my_colors.dart';
import 'package:my_blog/component/my_componnent.dart';
import 'package:my_blog/controller/single_article_controller.dart';
import 'package:my_blog/gen/assets.gen.dart';

// ignore: must_be_immutable
class SingleArticleScreen extends StatefulWidget {
  const SingleArticleScreen({super.key});

  @override
  State<SingleArticleScreen> createState() => _SingleArticleScreenState();
}

class _SingleArticleScreenState extends State<SingleArticleScreen> {

  SingleArticleController singleArticleController = Get.put(
    SingleArticleController(),
  );

  @override
  void initState() {
    super.initState();
    singleArticleController.getArticleInfo();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Obx(
            ()=> Column(
              children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl:singleArticleController.articleInfoModel.value.image!,
                      imageBuilder: ((context, imageProvider) =>
                          Image(image: imageProvider)),
            
                      placeholder: (context, url) => Center(child: Loading()),
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
                            Icon(Icons.arrow_back, color: Colors.white, size: 24),
                            Expanded(child: SizedBox()),
                            Icon(
                              Icons.bookmark_outline_rounded,
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(width: 12),
                            Icon(Icons.share, color: Colors.white, size: 24),
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
                        singleArticleController.articleInfoModel.value.title!,
                        maxLines: 2,
                        style: textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Assets.images.a3899618.image(scale: 6),
                          SizedBox(width: 12),
                          Text(
                            singleArticleController.articleInfoModel.value.author!,
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
            
                    HtmlWidget(
                      "html",
                      enableCaching: true,
                      onLoadingBuilder: (context, element, loadingProgress) =>
                          Loading(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
