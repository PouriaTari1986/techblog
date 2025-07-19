
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_blog/const/my_colors.dart';
import 'package:my_blog/const/my_strings.dart';
import 'package:my_blog/gen/assets.gen.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return  SafeArea(child:
     Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
            SvgPicture.asset(Assets.images.welcome.path,height: 120,),
            SizedBox(height: 25,),
        
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
              text: MyStrings.welcome,style: textTheme.titleMedium
            )),
            SizedBox(height: 18,),
            ElevatedButton(
              onPressed: ((){}), 


              style: ButtonStyle(backgroundColor:
                WidgetStateProperty.resolveWith<Color>((states) {
                  
                  if(states.contains(WidgetState.pressed)){

                    return SolidColors.primaryColor;
                  }
                    return SolidColors.seeMore;
                },)  
               ),
               
              
              child: 
              Text(MyStrings.letsGo,style: textTheme.headlineLarge,)
              
              )
        
          ],
        ),
      ),
     ));
  }
}