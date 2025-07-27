import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:my_blog/component/constant/my_colors.dart';
import 'package:my_blog/component/constant/my_componnent.dart';
import 'package:my_blog/component/constant/my_strings.dart';
import 'package:my_blog/component/dimens.dart';
import 'package:my_blog/controller/article/managed_article_controller.dart';
import 'package:my_blog/controller/file_controller.dart';
import 'package:my_blog/gen/assets.gen.dart';
import 'package:my_blog/services/pick_file.dart';

// ignore: must_be_immutable

// ignore: must_be_immutable
class SingleManageArticle extends StatelessWidget {
  var manageArticleController = Get.find<ManagedArticleController>();
  var pickFileController = Get.put(FilePickerController());

  void getTitle(){
    Get.defaultDialog(title: "عنوان مقاله",
    titleStyle: TextStyle(color: SolidColors.scaffoldBackGround),
    
    content: TextField(
      controller: manageArticleController.titleEditingController,
      keyboardType: TextInputType.text,
      style: TextStyle(backgroundColor: const Color.fromARGB(255, 171, 187, 206)),
      decoration: InputDecoration(
        hintText: "اینجا بنویس",
      ),
    ),
    backgroundColor: SolidColors.primaryColor,
    radius: 8,
    confirm: ElevatedButton(onPressed:((){
      manageArticleController.updateTitle();
      Get.back();

    }),
     
     child: Text("ثبت کردن"))
    );

  }

  SingleManageArticle({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Obx(
            () => Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: Get.width,
                      height: Get.height/3,
                      child: filePickerController.file.value.name == "nothing"?
                    CachedNetworkImage(
                      imageUrl:
                          manageArticleController.articleInfoModel.value.image!,
                      imageBuilder: ((context, imageProvider) =>
                          Image(image: imageProvider)),

                      placeholder: (context, url) => Loading(),
                      errorWidget: (context, url, error) =>
                          Assets.images.singlePlaceHolder.image(fit: BoxFit.cover),
                    ):Image.file(
                      
                      File(filePickerController.file.value.path!,),
                      fit: BoxFit.cover,
                      ),
                    )
                    ,Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            pickFiles();
                          },
                          child: Container(
                            height: 40,
                            width: Get.width / 3,
                          
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                              color: SolidColors.primaryColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "انتخاب تصویر",
                                  style: textTheme.headlineSmall,
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.add, color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      ),
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
                              onTap: () => Get.back(),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            Expanded(child: SizedBox()),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: Dimens.bodyMargin),
                    GestureDetector(
                      onTap: () => getTitle(),
                      child: SeeMore(
                        bodyMargin: Dimens.bodyMargin,
                        textTheme: textTheme,
                        size: Get.size,
                        title: MyStrings.editingArticle,
                      ),
                    ),
                    SizedBox(height: 12,),
                    Padding(
                      padding:  EdgeInsets.all(Dimens.halfBodyMargin),

                      child: Text(
                        manageArticleController.articleInfoModel.value.title!,
                        maxLines: 2,
                        style: textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                               
                               
                              ],
                            ),
                    ),
                    SeeMore(bodyMargin: Dimens.bodyMargin, textTheme: textTheme, size: Get.size, title: MyStrings.editingTheMainContent),
                    Padding(
                      padding:  EdgeInsets.all(Dimens.halfBodyMargin),
                      child: HtmlWidget(
                        manageArticleController.articleInfoModel.value.content!,
                        textStyle: textTheme.titleSmall,
                        enableCaching: true,
                        onLoadingBuilder: (context, element, loadingProgress) =>
                            Loading(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimens.bodyMargin,),
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: SeeMore(bodyMargin: Dimens.bodyMargin, textTheme: textTheme, size: Get.size, title: MyStrings.chooseThetags)),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  // child: tags(textTheme),
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget tags(TextTheme textTheme) {
  //   return SizedBox(
  //     height: 35,
  //     child: ListView.builder(
  //       itemCount: manageArticleController.tagList.length,
  //       scrollDirection: Axis.horizontal,
  //       itemBuilder: ((context, index) {
  //         return GestureDetector(
  //           onTap: () async {
  //             var tagId = manageArticleController.tagList[index].id;

  //             await Get.find<ListArticleController>().getArticleListWithTagsId(
  //               tagId!,
  //             );

  //             Get.to((ArticleListScreen()));
  //           },
  //           child: Padding(
  //             padding: const EdgeInsets.only(left:12),
  //             child: Container(
  //               height: 30,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.all(Radius.circular(24)),
  //                 color: SolidColors.hintText,
  //               ),
  //               child: Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: Text(
  //                   manageArticleController.tagList[index].title!,
  //                   style: textTheme.headlineSmall,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         );
  //       }),
  //     ),
  //   );
  // }
}
