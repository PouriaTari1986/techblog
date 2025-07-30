import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog/component/constant/my_componnent.dart';
import 'package:my_blog/controller/home_screen_controller.dart';
import 'package:my_blog/controller/podcasts/podcats_file_controller.dart';
import 'package:my_blog/models/podcast_model.dart';
import 'package:my_blog/route_manager/names.dart';

// ignore: must_be_immutable
class PodcatsListScreen extends StatelessWidget {
 

 final String title;

  late SinglePodcastController controller;

  PodcastModel? podcastModel;

  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  PodcatsListScreen({super.key, required this.title,});

  
  
  
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: appBar("لیست پادکست ها"),

      body: Obx(
        () => 
        ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: homeScreenController.topPodcast.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: ()async {
               Get.toNamed(NamedRoute.singlePodcast,arguments:homeScreenController.topPodcast[index] );
              },

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width / 4,
                      height: Get.height / 8,
                      child: CachedNetworkImage(
                        imageUrl:
                            homeScreenController.topPodcast[index].poster!,
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },

                        placeholder: (context, url) => Loading(),
                        errorWidget: (context, url, error) => Icon(
                          Icons.image_not_supported_outlined,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Get.width / 2,
                          child: Text(
                            homeScreenController.topPodcast[index].title!,
                            style: textTheme.titleMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              homeScreenController.topPodcast[index].author!,
                              style: textTheme.displaySmall,
                            ),
                            SizedBox(width: 20),
                            Text(
                              "${homeScreenController.topPodcast[index].view!}بازدید",
                              style: textTheme.displaySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ),
    );
  }
}
