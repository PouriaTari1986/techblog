// ignore: camel_case_types
import 'package:flutter/material.dart';
import 'package:my_blog/const/my_colors.dart';
import 'package:my_blog/const/my_strings.dart';
import 'package:my_blog/gen/assets.gen.dart';
import 'package:my_blog/my_componnent.dart';

// ignore: camel_case_types
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
    required this.size,
  });

  final double bodyMargin;
  final TextTheme textTheme;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [

        Assets.images.a3899618.image(height: 120),
        SizedBox(height: 12,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          Assets.icons.write.image(color: SolidColors.seeMore,height: 30),
          SizedBox(width: 8,),
          Text(MyStrings.imageProfileEdit,style: textTheme.headlineMedium,)


        ],),
        SizedBox(height: 60,),
        Text("فاطمه امیری",style: textTheme.titleMedium,),
        SizedBox(height: 12,),
        Text("fatemeamiri@gmail.com",style: textTheme.titleMedium,),
        SizedBox(height: 40,),
        TechDivider(size: size),
        InkWell(
          onTap: () {
            
          },
          splashColor: SolidColors.primaryColor,
          child:   SizedBox(
            height: 45,
            child: Center(child: Text(MyStrings.myFavoriteBlog,style: textTheme.titleSmall,))),
        ),
        TechDivider(size: size),
        InkWell(
          onTap: () {
            
          },
          splashColor: SolidColors.primaryColor,
          child:   SizedBox(
            height: 45,
            child: Center(child: Text(MyStrings.myFavoritePodcast,style: textTheme.titleSmall,))),
        ),
        TechDivider(size: size),
        InkWell(
          onTap: () {
            
          },
          splashColor: SolidColors.primaryColor,
          child:   SizedBox(
            height: 45,
            child: Center(child: Text(MyStrings.logOut,style: textTheme.titleSmall,))),
        ),
      SizedBox(height: 60,)
        
      ],)
      );
  }
}



