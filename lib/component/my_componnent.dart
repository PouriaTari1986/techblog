

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog/component/my_colors.dart';
import 'package:my_blog/controller/home_screen_controller.dart';
import 'package:my_blog/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.2,
      color: SolidColors.dividerColor,
      indent: size.width/6,
      endIndent: size.width/6,
    );
  }
}
// ignore: must_be_immutable
class TagList extends StatelessWidget {
    TagList({
    required this.textTheme,
    required this.index,
    super.key,

  });
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  final TextTheme textTheme;
  
  final int index;

  @override
  Widget build(BuildContext context) {

   
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        gradient: LinearGradient(
          colors: GradiantColors.tags,
          begin: Alignment.centerRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              Assets.icons.hashtag.provider(),
              color: Colors.white,
              size: 16,
            ),
            SizedBox(width: 8),
            Text(homeScreenController.tagList[index].title!, style: textTheme.headlineSmall),
          ],
        ),
      ),
    );
  }
}



Future<void> myLaunchUrl(String url, ) async {

var uri = Uri.parse(url);

  if(!await canLaunchUrl(uri)){

    await launchUrl(uri);
  }else{
    // ignore: avoid_print
    print("Could not launch $url");
  }


}