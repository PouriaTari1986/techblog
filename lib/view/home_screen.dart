import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog/Models/fake_data/fake_data.dart';
import 'package:my_blog/component/my_colors.dart';
import 'package:my_blog/component/my_strings.dart';
import 'package:my_blog/controller/home_screen_controller.dart';
import 'package:my_blog/gen/assets.gen.dart';
import 'package:my_blog/component/my_componnent.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
   HomeScreen({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
    required this.size,
  });
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  final double bodyMargin;
  final TextTheme textTheme;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
        child: Column(
          children: [
            HomePagePoster(size: size, textTheme: textTheme),
            SizedBox(height: 16),

            HomePageTagList(bodyMargin: bodyMargin, textTheme: textTheme),

            SeeMoreBlog(),
            Padding(
              padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
              child: Row(
                children: [
                  Assets.icons.write.image(color: SolidColors.seeMore,height: 30),
                  SizedBox(width: 8),
                  Text(
                    MyStrings.viewHottestBlog,
                    style: textTheme.headlineMedium,
                  ),
                ],
              ),
            ),

            topVisited(),
            SizedBox(height: 32),
            SeeMorePodcast(bodyMargin: bodyMargin, textTheme: textTheme),
            HomePagePodcast(
              size: size,
              bodyMargin: bodyMargin,
              textTheme: textTheme,
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
  Widget topVisited(){

    return SizedBox(
      height: size.height / 3.5,
      child:Obx(()=> ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homeScreenController.topVisitedList.length,
        itemBuilder: ((context, index) {
          //blog item
          return Padding(
            padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
            child: Column(
              children: [
                SizedBox(
                  width: size.width / 2.4,
                  height: size.height / 5.5,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          image: DecorationImage(
                            image: NetworkImage(
                              homeScreenController.topVisitedList[index].image!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        foregroundDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          gradient: LinearGradient(
                            colors: GradiantColors.blogPostGradiant,
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 8,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              homeScreenController.topVisitedList[index].author!,
                              style: textTheme.headlineSmall,
                            ),
                            Row(
                              children: [
                                Text(
                                  homeScreenController.topVisitedList[index].view!,
                                  style: textTheme.headlineSmall,
                                ),

                                SizedBox(width: 8),
                                Icon(
                                  Icons.remove_red_eye_sharp,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  
                  width: size.width / 2.4,
                  child: Text(
                    homeScreenController.topVisitedList[index].title!,style: textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
      )
    );

  }
}

class HomePagePodcast extends StatelessWidget {
  const HomePagePodcast({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: podcastList.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 5.3,
                  width: size.width / 2.4,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      image: DecorationImage(
                        image: NetworkImage(podcastList[index].imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                SizedBox(
                  width: size.width / 2.4,
                  child: Text(
                    podcastList[index].title,
                    style: textTheme.titleMedium,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Column(
        children: [
          Row(
            children: [
              Assets.icons.podcast.image(height:35 ),
              SizedBox(width: 8,),
              Text(MyStrings.viewHottestPodcast, style: textTheme.headlineMedium),
            ],
          ),
         
        ],
      ),
      
    );
  }
}



class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 32);
  }
}

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tagList.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
            child: TagList(textTheme: textTheme,index: index,),
          );
        }),
      ),
    );
  }
}


class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.19,
          height: size.height / 4.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
              image: AssetImage(homePagePosterMap["imageUrl"],),
              fit: BoxFit.cover,
            ),
          ),
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: GradiantColors.homePosterCoverGradiant,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "${homePagePosterMap["writer"]} - ${homePagePosterMap["date"]}",
                    style: textTheme.headlineSmall,
                  ),

                  Row(
                    children: [
                      Text(
                        homePagePosterMap["view"],
                        style: textTheme.headlineSmall,
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.remove_red_eye_sharp, color: Colors.white),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8,),
              Text(homePagePosterMap["title"], style: textTheme.headlineLarge),
            ],
          ),
        ),
      ],
    );
  }
}
