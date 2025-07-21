import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_blog/Models/fake_data/fake_data.dart';
import 'package:my_blog/component/my_colors.dart';
import 'package:my_blog/component/my_strings.dart';
import 'package:my_blog/gen/assets.gen.dart';
import 'package:my_blog/component/my_componnent.dart';

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
    double bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 32),
                SvgPicture.asset(Assets.images.welcome.path, height: 120),

                const SizedBox(height: 16),

                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: MyStrings.mayCat,
                    style: textTheme.titleMedium,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                    left: bodyMargin,
                    right: bodyMargin,
                    top: 16,
                  ),
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
                  child: Text(
                    MyStrings.selectingCat,
                    style: textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
                  child: SizedBox(
                    height: size.height / 8.8,
                    width: double.infinity,
                    child: GridView.builder(
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: tagList.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 0.38,
                          ),

                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              if (!selectedTags.contains(tagList[index])) {
                                selectedTags.add(tagList[index]);
                              }else{
                                // ignore: avoid_print
                                print("${tagList[index].title} exist");
                              }
                            });
                          },

                          child: TagList(textTheme: textTheme, index: index),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16),
                SvgPicture.asset(Assets.images.arrow.path, height: 50),

                Padding(
                  padding: EdgeInsets.only(
                    left: bodyMargin,
                    right: bodyMargin,
                    top: 16,
                  ),
                  //selectedTags
                  child: SizedBox(
                    height: size.height / 8.8,
                    width: double.infinity,
                    child: GridView.builder(
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: selectedTags.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 0.3,
                          ),

                      itemBuilder: (context, index) {
                        return Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            color: SolidColors.surfaceColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: 8),
                                Text(
                                  selectedTags[index].title,
                                  style: textTheme.titleMedium,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedTags.removeAt(index);
                                    });
                                  },

                                  child: Icon(
                                    CupertinoIcons.delete,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: (() {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const MyCat()),
                    );
                  }),
                  child: Text("ادامه"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
