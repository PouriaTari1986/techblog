import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_blog/component/constant/my_componnent.dart';
import 'package:my_blog/component/constant/my_strings.dart';
import 'package:my_blog/controller/article/managed_article_controller.dart';
import 'package:my_blog/gen/assets.gen.dart';
import 'package:my_blog/route_manager/names.dart';

// ignore: must_be_immutable
class ManagedArticle extends StatelessWidget {
  ManagedArticle({super.key});

  var articleManageController = Get.find<ManagedArticleController>();
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    // var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: appBar(" مدیریت مقاله ها"),
        body: Center(
          child: Obx(
            () => articleManageController.loading.value== false
                ? Loading()
                : articleManageController.articleList.isNotEmpty
                ? ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: articleManageController.articleList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {},

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Get.width / 4,
                                height: Get.height / 8,
                                child: CachedNetworkImage(
                                  imageUrl: articleManageController
                                      .articleList[index]
                                      .image!,
                                  imageBuilder: (context, imageProvider) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
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
                                      articleManageController
                                          .articleList[index]
                                          .title!,
                                      style: textTheme.titleMedium,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        articleManageController
                                            .articleList[index]
                                            .author!,
                                        style: textTheme.displaySmall,
                                      ),
                                      SizedBox(width: 20),
                                      Text(
                                        "${articleManageController.articleList[index].view!}بازدید",
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
                  )
                : articleEmptyState(textTheme)
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(top: 32),
          child: Padding(
            padding:  EdgeInsets.all(16),
            child: ElevatedButton(
              style: ButtonStyle(fixedSize: WidgetStateProperty.all(Size(Get.width/3, 56))),
              onPressed: (() {
                Get.toNamed(NamedRoute.singleManageArticle);
              }),
                
              child: Text(
                MyStrings.letsGoWriting,
                style: textTheme.headlineLarge,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget articleEmptyState(TextTheme textTheme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.icons.articleWriting.path, height: 120),
        SizedBox(height: 35),

        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: MyStrings.wriringArticle,
            style: textTheme.titleMedium,
          ),
        ),
        
      ],
    );
  }
}
