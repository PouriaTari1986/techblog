import 'package:flutter/material.dart';
import 'package:my_blog/const/my_colors.dart';
import 'package:my_blog/gen/assets.gen.dart';
import 'package:my_blog/view/main_screen.dart';
import 'package:my_blog/view/profile_screen.dart';

// ignore: camel_case_types
class MainScrren extends StatefulWidget {
  const MainScrren({super.key});

  @override
  State<MainScrren> createState() => _MainScrrenState();
}

class _MainScrrenState extends State<MainScrren> {

 var selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 10;

   



    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: SolidColors.scaffoldBackGround,
          title:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.menu, color: Colors.black),
            
                      Assets.images.logo.image(height: size.height / 14),
            
                      Icon(Icons.search, color: Colors.black),
                    ],
                  ),
        ),


          
        body: Stack(
          children: [
            Positioned.fill(
              child: IndexedStack(
                index: selectedPageIndex,
                children: [
                  HomeScreen(bodyMargin: bodyMargin, textTheme: textTheme, size: size),
                  ProfileScreen(bodyMargin: bodyMargin, textTheme: textTheme, size: size)
                ],
              )
              ),
         
            // ignore: avoid_types_as_parameter_names
            BottomNavigation(size: size, bodyMargin: bodyMargin, changeScreen: (int value) {  
              setState(() {
                selectedPageIndex = value;
              });

            },)
          ],
        )
      
         
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
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: size.height/10,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: GradiantColors.bottomNavigationbg,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter)
        ),
        child: Padding(
          padding:  EdgeInsets.only(right: bodyMargin,left: bodyMargin),
          child: Container(
            height: size.height/8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(22)),
              gradient: LinearGradient(colors: GradiantColors.bottomNavigation)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
          
                IconButton(
                  onPressed: (()=>changeScreen(0)), 
                  icon: ImageIcon(Assets.icons.home.provider())),
          
                IconButton(
                  onPressed: (){}, 
                  icon: ImageIcon(Assets.icons.register.provider())),
          
                IconButton(
                  onPressed: (()=>changeScreen(1)), 
                  icon: ImageIcon(Assets.icons.user.provider())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

