import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:my_blog/component/constant/my_colors.dart';
import 'package:my_blog/component/text_style.dart';
import 'package:my_blog/controller/home_screen_controller.dart';
import 'package:my_blog/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.2,
      color: SolidColors.dividerColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

// ignore: must_be_immutable
class TagList extends StatelessWidget {
  const TagList({required this.textTheme, required this.index, super.key});

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
            Text(
              Get.find<HomeScreenController>().tagList[index].title!,
              style: textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> myLaunchUrl(String url) async {
  var uri = Uri.parse(url);

  if (!await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    // ignore: avoid_print
    print("Could not launch $url");
  }
}

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCube(color: SolidColors.primaryColor, size: 32);
  }
}

PreferredSize appBar(String title) {
  return PreferredSize(
    preferredSize: Size.fromHeight(60),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: SolidColors.primaryColor,
              shape: BoxShape.circle,
            ),
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Icon(Icons.keyboard_arrow_right, color: Colors.white),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Center(child: Text(title, style: appBarTextStyle)),
          ),
        ],
      ),
    ),
  );
}

// ignore: must_be_immutable
class SeeMore extends StatelessWidget {
  SeeMore({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
    required this.size,
    required this.title,
  });

  final double bodyMargin;
  final TextTheme textTheme;
  final Size size;
  String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: Padding(
        padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
        child: Row(
          children: [
            Assets.icons.write.image(color: SolidColors.seeMore, height: 30),
            SizedBox(width: 8),
            Text(title, style: textTheme.headlineMedium),
          ],
        ),
      ),
    );
  }
}

