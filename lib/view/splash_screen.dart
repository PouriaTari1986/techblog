import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:my_blog/component/constant/my_colors.dart';
import 'package:my_blog/gen/assets.gen.dart';
import 'package:my_blog/main.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
   
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((onValue){
      if(mounted){
        Get.offAndToNamed(NamedRoute.routMainScreen);
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SizedBox(
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
            Assets.images.logo.image(height: 100),
        
            SizedBox(height: 16,),
        
            SpinKitFadingCube(
              color: SolidColors.primaryColor,
              size: 30,
            )
        
          ],
        ),
      ),
    );

  }
}