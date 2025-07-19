import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_blog/const/my_colors.dart';
import 'package:my_blog/view/register_intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [ 
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: ([
        Locale('fa','')//farsi
      ]),
      theme: ThemeData(
        fontFamily: 'dana',
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: SolidColors.posterTitle
          ),
          headlineMedium: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: SolidColors.seeMore
          ),
          headlineSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: SolidColors.posterTitle
          ),
          titleLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: SolidColors.seeMore
          ),
          titleMedium: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: SolidColors.textTitles
          ),
          titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: SolidColors.textTitles
          ),
        )
        
      ),
      home: RegisterIntro(),
    );
  
  }
}
