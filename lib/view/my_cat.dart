


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_blog/const/my_strings.dart';
import 'package:my_blog/gen/assets.gen.dart';
import 'package:my_blog/models/fake_data.dart';
import 'package:my_blog/my_componnent.dart';

class MyCat extends StatefulWidget {
  const MyCat({super.key});

  @override
  State<MyCat> createState() => _MyCatState();
}

class _MyCatState extends State<MyCat> {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = size.width/10;


    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 32,),
                SvgPicture.asset(Assets.images.welcome.path, height: 120),
            
            
                const SizedBox(height: 16),
            
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                  
                  text: MyStrings.mayCat,style: textTheme.titleMedium )),

                  Padding(
                    padding:  EdgeInsets.only(left: bodyMargin, right: bodyMargin,top: 16),
                    child: TextField(
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: "نام و نام خانوادگی",
                        hintStyle: textTheme.displayLarge,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Text(MyStrings.selectingCat,style: textTheme.titleMedium,textAlign: TextAlign.center,),
                  ),

                  SizedBox(
                    height: size.height/8.6,
                    width: size.width/1.08,
                    child: GridView.builder(
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: tagList.length,
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.37,
                      ),
                    
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              myCat.add(tagList[index]);
                              tagList.removeAt(index);
                            });
                          },
                          
                          child: TagList(textTheme: textTheme, index: index));
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  SvgPicture.asset(Assets.images.arrow.path, height: 70),
                  SizedBox(height: 16),
                   SizedBox(
                    height: size.height/8.6,
                    width: size.width/1.08,
                    child: GridView.builder(
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: tagList.length,
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.37,
                      ),
                    
                      itemBuilder: (context, index) {
                        return TagList(textTheme: textTheme, index: index);
                      },
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