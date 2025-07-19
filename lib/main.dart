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
    var textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: ([
        Locale('fa', ''), //farsi
      ]),
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16),
          
          ),
          borderSide: BorderSide(width: 2)
          ),
          filled: true
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
          displayLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: SolidColors.hintText,
          ),
        ),
      ),
      home: RegisterIntro(),
    );
  }
}
