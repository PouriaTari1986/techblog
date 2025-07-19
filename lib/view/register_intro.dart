
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_blog/const/my_strings.dart';
import 'package:my_blog/gen/assets.gen.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
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
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: ElevatedButton(
                onPressed: ((){

                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context, 
                    
                    builder: (context){

                      return Padding(
                        padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          height: size.height/2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), 
                            topRight: Radius.circular(30)),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(MyStrings.entrEmial,style: textTheme.titleMedium,),
                                Padding(
                                  padding: const EdgeInsets.all(24),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText:  "techBlog@gmail.com",
                                      hintStyle: textTheme.displayLarge
                                    ),
                                    ),
                                    
                                ),
                                ElevatedButton(
                                  onPressed: ((){}), 
                                  child: Text("ادامه"))
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    
                    );
                }), 
              
              
                
                 
                child: Text(MyStrings.letsGo,style: textTheme.headlineLarge,),
                
                
                ),
            )
        
          ],
        ),
      ),
     ));
  }
}