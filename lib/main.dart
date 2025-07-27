import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_blog/binding.dart';
import 'package:my_blog/component/constant/my_colors.dart';
import 'package:my_blog/view/article/manage_article.dart';
import 'package:my_blog/view/article/single_manage_article.dart';
import 'package:my_blog/view/main_screen/main_screen.dart';
import 'package:my_blog/view/my_http_overrides.dart';
import 'package:my_blog/view/article/single_article_screen.dart';
import 'package:my_blog/view/splash_screen.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();

  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return GetMaterialApp(
      locale: const Locale('fa', 'IR'),
      textDirection: TextDirection.rtl,
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: NamedRoute().routMainScreen,
          page: (() => MainScreen()),
          binding: RegisterBinding(),
        ),

        GetPage(
          name: NamedRoute().routeSingleArticle,
          page: (() => SingleArticleScreen()),
          binding: ArticleBinding(),
        ),
        GetPage(
          name: NamedRoute().managedArtice,
          page: (() => ManagedArticle()),
          binding: ArticleManagerBinding(),
        ),
        GetPage(
          name: NamedRoute().singleManageArticle,
          page: (() => SingleManageArticle()),
          binding: ArticleManagerBinding(),
        ),
      ],
      theme: lightTheme(textTheme),
      home: SplashScreen(),
    );
  }

  ThemeData lightTheme(TextTheme textTheme) {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(width: 2),
        ),
        filled: true,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.pressed)) {
              return const Color.fromARGB(255, 19, 75, 138);
            }
            return SolidColors.primaryColor;
          }),
          textStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
            if (states.contains(WidgetState.pressed)) {
              return textTheme.headlineLarge!;
            }
            return textTheme.headlineSmall!;
          }),
        ),
      ),

      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        headlineMedium: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w700,
          color: SolidColors.seeMore,
        ),
        headlineSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        titleLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: SolidColors.seeMore,
        ),
        titleMedium: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w700,
          color: SolidColors.textTitles,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: SolidColors.textTitles,
        ),
        displayMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: SolidColors.textTitles,
        ),
        displayLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: const Color.fromARGB(255, 66, 41, 41),
        ),
        displaySmall: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: SolidColors.subText,
        ),
      ),
    );
  }
}


class NamedRoute{
String routMainScreen = "/MainScreen";
String routeSingleArticle = "/SingleArticle";
String managedArtice = "/ManageArticle";
String singleManageArticle = "/SingleManageArticle";


}