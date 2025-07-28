
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:my_blog/component/constant/my_componnent.dart';
import 'package:my_blog/controller/article/managed_article_controller.dart';

// ignore: must_be_immutable
class ArticleContentEditor extends StatelessWidget {



   ArticleContentEditor({super.key});


   var manageArticleController = Get.put(ManagedArticleController());

  final HtmlEditorController controller = HtmlEditorController();
  @override
  Widget build(BuildContext context) {
//  var textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        controller.clearFocus();
        
      },
      child: Scaffold(
        appBar: appBar("نوشتن/ویرایش مقاله"),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              HtmlEditor(

                controller: controller,
                htmlEditorOptions: HtmlEditorOptions(
                  hint: "میتونی مقالت رواینجا بنویسی...",
                  shouldEnsureVisible: true,
                  initialText: manageArticleController.articleInfoModel.value.content,

                ),
                callbacks: Callbacks(
                  onChangeContent: (p0) {
                    manageArticleController.articleInfoModel.update((val) {
                      val?.content = p0;
                    },);
                    log("manageArticleController.articleInfoModel.value.content");
                  },
                ),
                )

            ],
          ),
        ),
      
      ),
    );
  }
}