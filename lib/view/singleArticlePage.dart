
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:my_blog/component/my_colors.dart';
import 'package:my_blog/component/my_componnent.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_blog/controller/single_article_controller.dart';
import 'package:my_blog/gen/assets.gen.dart';

// ignore: must_be_immutable
class SingleArticleInfo extends StatelessWidget {
   SingleArticleInfo({super.key});

  SingleAticleController singleAticleController = Get.put(SingleAticleController());

  @override
  Widget build(BuildContext context) {

var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: singleAticleController.articleInfoModel.value!.image!,
                  imageBuilder: (context, imageProvider) => 
                  Image(image: imageProvider, fit: BoxFit.cover),
                  placeholder: (context, url) => Loading(),
                  errorWidget: (context, url, error) =>
                      Assets.images.singlePlaceHolder.image(),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: GradiantColors.singleAppBarGradiant,
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(width: 12),
                        Icon(Icons.arrow_back, color: Colors.white, size: 24),

                        Expanded(child: SizedBox()),

                        Icon(
                          Icons.bookmark_border_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                        SizedBox(width: 20),

                        Icon(Icons.share, color: Colors.white, size: 24),
                        SizedBox(width: 12),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(singleAticleController.articleInfoModel.value!.title!,maxLines: 2,style: textTheme.titleMedium,),
            ),

            Row(
              children: [
                SizedBox(width: 12,),
                Assets.images.a3899618.image(height: 50),
                SizedBox(width: 16,),
                Text(singleAticleController.articleInfoModel.value!.author!,style: textTheme.titleSmall,),
                SizedBox(width: 25,),
                Text(singleAticleController.articleInfoModel.value!.createdAt!,style: textTheme.displayMedium,),
              ],
            ),

            HtmlWidget(
              singleAticleController.articleInfoModel.value!.content!,
              enableCaching: true,
              onLoadingBuilder: (context, element, loadingProgress) => Loading(),
              ),
              
          ],
        ),
      ),
    );
  }
}
