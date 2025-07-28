import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog/component/constant/my_colors.dart';
import 'package:my_blog/component/constant/my_strings.dart';
import 'package:my_blog/controller/home_screen_controller.dart';
import 'package:my_blog/controller/article/list_article_controller.dart';
import 'package:my_blog/controller/article/single_article_controller.dart';
import 'package:my_blog/gen/assets.gen.dart';
import 'package:my_blog/component/constant/my_componnent.dart';
import 'package:my_blog/view/article/article_list_screen.dart';
import 'package:my_blog/view/article/single_article_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
    required this.size,
  });
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  SingleArticleController singleArticleController = Get.put(SingleArticleController());
  final double bodyMargin;
  final TextTheme textTheme;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
          child: homeScreenController.loading.value==false? 
            Column(
              children: [
                homePagePoster(),
                SizedBox(height: 16),
            
                homePageTaglist(),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Get.to((ArticleListScreen()));
                  },
                  child: SeeMore(bodyMargin: bodyMargin, textTheme: textTheme, size: size, title: MyStrings.viewHottestBlog,)),
                SizedBox(height: 16),
            
                topVisited(),
                SizedBox(height: 32),
                seeMorePodcast(),
                SizedBox(height: 16),
                topPodcast(),
                SizedBox(height: 60),
              ],
            )
          : Loading(),
        ),
      ),
    );
  }

  Widget homePageTaglist() {
    return SizedBox(
      height: 60,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.tagList.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () async{
                var tagId = singleArticleController.tagList[index].id!;
                  await Get.find<ListArticleController>().getArticleListWithTagsId(tagId);

                    Get.to(ArticleListScreen());

              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  0,
                  8,
                  index == 0 ? bodyMargin : 15,
                  8,
                ),
                child: TagList(textTheme: textTheme, index: index,  
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget homePagePoster() {
    return  Obx(
      () => Stack(
          children: [
            Container(
              width: size.width / 1.25,
              height: size.height / 4.2,
            
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(
                  colors: GradiantColors.homePosterCoverGradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: homeScreenController.poster.value.image!,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => Center(
                  child: Loading(),
                ),
                errorWidget: (context, url, error) => Icon(
                  Icons.image_not_supported_outlined,
                  color: Colors.grey,
                  size: 50,
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 0,
              right: 0,
              child: Text(homeScreenController.poster.value.title!, style: textTheme.headlineLarge,textAlign: TextAlign.center,),
            ),
          ],
      
      ),
    );
  }

  Widget seeMorePodcast() {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
      child: Column(
        children: [
          Row(
            children: [
              Assets.icons.podcast.image(height: 35),
              SizedBox(width: 8),
              Text(
                MyStrings.viewHottestPodcast,
                style: textTheme.headlineMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget topPodcast() {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.topPodcast.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 5.3,
                    width: size.width / 2.4,
                    child: CachedNetworkImage(
                      imageUrl: homeScreenController.topPodcast[index].poster!,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                        
                      ),
                      placeholder: (context, url) => Center(
                        child: Loading()
                      ),
                      errorWidget: (context, url, error) => Icon(
                        Icons.image_not_supported_outlined,
                        color: Colors.grey,
                        size: 50,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    width: size.width / 2.4,
                    child: Text(
                      homeScreenController.topPodcast[index].title!,
                      style: textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget topVisited() {
    return SizedBox(
      height: size.height / 3.3,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.topVisitedList.length,
          itemBuilder: ((context, index) {
            //blog item
            return GestureDetector(

              onTap: (() {
                singleArticleController.getArticleInfo(
                  homeScreenController.topVisitedList[index].id,
                  
                );
                Get.to((SingleArticleScreen()));
              }),
              child: Padding(
                padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
                child: Column(
                  children: [
                    SizedBox(
                      width: size.width / 2.4,
                      height: size.height / 5.5,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: homeScreenController.topVisitedList[index].image!,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image:imageProvider,fit: BoxFit.cover,
                                   ),
                                   
                              
                            ),
                            foregroundDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: GradiantColors.homePosterCoverGradiant,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                         
                          ),
                             placeholder: (context, url) => Center(
                              child: Loading(),
                            ),
                            errorWidget: (context, url, error) => Icon(
                              Icons.image_not_supported_outlined,
                              color: Colors.grey,
                              size: 50,
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
                                  homeScreenController
                                      .topVisitedList[index]
                                      .author!,
                                  style: textTheme.headlineSmall,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      homeScreenController
                                          .topVisitedList[index]
                                          .view!,
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
                        homeScreenController.topVisitedList[index].title!,
                        style: textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

