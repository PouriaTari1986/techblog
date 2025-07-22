import 'package:flutter/material.dart';
import 'package:my_blog/component/my_colors.dart';
import 'package:my_blog/component/my_componnent.dart';
import 'package:my_blog/component/my_strings.dart';
import 'package:my_blog/gen/assets.gen.dart';
import 'package:my_blog/view/home_screen.dart';
import 'package:my_blog/view/profile_screen.dart';
import 'package:my_blog/view/register_intro.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';



final GlobalKey<ScaffoldState> _key = GlobalKey();

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  RxInt selectedPageIndex = 0.obs;

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: SolidColors.scaffoldBackGround,
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Center(child: Assets.images.logo.image(scale: 3)),
                ),

                ListTile(
                  title: Text("پروفایل کاربری", style: textTheme.titleMedium),
                  onTap: () {},
                ),

                Divider(color: SolidColors.dividerColor),

                ListTile(
                  title: Text("درباره تک بلاگ", style: textTheme.titleMedium),
                  onTap: () {

                    myLaunchUrl( MyStrings.githubUrl);
                  },
                ),

                Divider(color: SolidColors.dividerColor),

                ListTile(
                  title: Text(
                    "اشتراک گذاری تک بلاگ",
                    style: textTheme.titleMedium,
                  ),
                  onTap: () async {
                    await SharePlus.instance.share(ShareParams(text: MyStrings.shareText));
                  },
                ),

                Divider(color: SolidColors.dividerColor),

                ListTile(
                  title: Text(
                    "تک بلاگ در گیت هاب",
                    style: textTheme.titleMedium,
                  ),
                  onTap: () {

                   myLaunchUrl( MyStrings.githubUrl);
                  },
                ),
                Divider(color: SolidColors.dividerColor),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: SolidColors.scaffoldBackGround,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: Icon(Icons.menu, color: Colors.black),
              ),

              Assets.images.logo.image(height: size.height / 14),

              Icon(Icons.search, color: Colors.black),
            ],
          ),
        ),

        body: Stack(
          children: [
            Positioned.fill(
              child: Obx(()=>IndexedStack(
                index: selectedPageIndex.value,
                children: [
                  HomeScreen(bodyMargin: bodyMargin, textTheme: textTheme, size: size),
                  RegisterIntro(),
                  ProfileScreen(bodyMargin: bodyMargin, textTheme: textTheme, size: size),
                ],
              )),
            ),

            BottomNavigation(
              size: size,
              bodyMargin: bodyMargin,
              changeScreen: (int value) {
               selectedPageIndex.value = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen,
  });

  final Size size;
  final double bodyMargin;
  final Function(int value) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
      right: 0,
      left: 0,
      child: Container(
        height: size.height / 10,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: GradiantColors.bottomNavigationbg,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Container(
            height: size.height / 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(35)),
              gradient: LinearGradient(colors: GradiantColors.bottomNavigation),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: (() => changeScreen(0)),
                  icon: ImageIcon(
                    Assets.icons.home.provider(),
                    size: 40,
                    color: Colors.white,
                  ),
                ),

                IconButton(
                  onPressed: () => changeScreen(1),
                  icon: ImageIcon(
                    Assets.icons.register.provider(),
                    size: 40,
                    color: Colors.white,
                  ),
                ),

                IconButton(
                  onPressed: (() => changeScreen(2)),
                  icon: ImageIcon(
                    Assets.icons.user.provider(),
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
