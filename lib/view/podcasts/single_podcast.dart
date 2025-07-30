import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog/component/constant/decoration.dart';
import 'package:my_blog/component/constant/my_colors.dart';
import 'package:my_blog/component/constant/my_componnent.dart';
import 'package:my_blog/component/constant/my_strings.dart';
import 'package:my_blog/component/dimens.dart';
import 'package:my_blog/controller/podcasts/podcats_file_controller.dart';
import 'package:my_blog/gen/assets.gen.dart';
import 'package:my_blog/models/podcast_model.dart';
import 'package:share_plus/share_plus.dart';

// ignore: must_be_immutable
class SinglePodcast extends StatelessWidget {
  late SinglePodcastController controller;
  late PodcastModel podcastModel;
  // ignore: use_key_in_widget_constructors
  SinglePodcast() {
    podcastModel = Get.arguments;
    controller = Get.put(SinglePodcastController(id: podcastModel.id));
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(controller.id.toString());
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: Get.height / 3,
                          width: double.infinity,
                          child: CachedNetworkImage(
                            imageUrl: podcastModel.poster!,
                            imageBuilder: ((context, imageProvider) =>
                                Image(image: imageProvider, fit: BoxFit.fill)),

                            placeholder: (context, url) => Loading(),
                            errorWidget: (context, url, error) =>
                                Assets.images.singlePlaceHolder.image(),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: GradiantColors.singleAppBarGradiant,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(width: 12),
                                InkWell(
                                  onTap: () => Get.back(),
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                Expanded(child: SizedBox()),
                                Icon(
                                  Icons.bookmark_outline_rounded,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                SizedBox(width: 12),
                                InkWell(
                                  onTap: () async => await SharePlus.instance
                                      .share(ShareParams(text: "لذت ببرید")),
                                  child: InkWell(
                                    onTap: () async =>
                                        await SharePlus.instance.share(
                                          ShareParams(
                                            text: MyStrings.shareText,
                                          ),
                                        ),
                                    child: Icon(
                                      Icons.share,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              podcastModel.title!,
                              maxLines: 2,
                              style: textTheme.titleMedium,
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Assets.images.avatar.image(height: 40),
                              SizedBox(width: 12),
                              Text(
                                podcastModel.author!,
                                style: textTheme.titleSmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(
                        () => ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.podcastEpisodeList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
                                await controller.player.seek(Duration.zero,index: index);
                                controller.timerCheck();
                                 controller.currentFileIndex.value =
                                  controller.player.currentIndex!;
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Assets.icons.podcast.image(
                                          height: 35,
                                          color: SolidColors.seeMore,
                                        ),
                                        SizedBox(width: 8),
                                        SizedBox(
                                          width: Get.width / 1.5,
                                          child: Obx(
                                            ()=> Text(
                                              controller
                                                  .podcastEpisodeList[index]
                                                  .title!,
                                              style:
                                              controller.currentFileIndex.value == index? textTheme.labelSmall:
                                              textTheme.titleSmall
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "${controller.podcastEpisodeList[index].length!}:00",
                                      style: textTheme.titleSmall,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              right: Dimens.bodyMargin,
              left: Dimens.bodyMargin,
              child: Container(
                height: Get.height / 8,
                decoration: MyDecoration.mainGradiant,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: 
                     Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8,right: 8),
                          child: ProgressBar(
                            buffered: controller.bufferedValue.value,
                            timeLabelTextStyle: TextStyle(color: Colors.white),
                            baseBarColor: Colors.white,
                            progressBarColor: Colors.orange,
                            thumbColor: Colors.yellow,
                            progress: controller.progressValue.value, 
                            total: controller.player.duration??Duration(seconds: 0),
                            onSeek: (position) async {
                              controller.player.seek(position);
                              controller.player.playing?
                              controller.startProgress():
                              controller.timer!.cancel();
                              controller.startProgress();

                              
                              if(controller.player.playing){
                                controller.startProgress();
                              }else{
                                if(position<= Duration(seconds: 0)){
                                 await controller.player.seekToNext();
                                  controller.currentFileIndex.value =controller.player.currentIndex!;
                                  controller.timerCheck();
                                }
                              }
                              
                            },
                            
                            ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await controller.player.seekToNext();
                                
                              
                                controller.currentFileIndex.value =
                                    controller.player.currentIndex!;
                                    controller.timerCheck();
                              },
                    
                              child: Icon(
                                Icons.skip_next,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                    
                            GestureDetector(
                              onTap: () {

                                controller.player.playing
                                    ? controller.timer!.cancel()
                                    : controller.startProgress();

                                controller.player.playing
                                    ? controller.player.pause()
                                    : controller.player.play();
                                controller.playState.value =
                                    controller.player.playing;
                                controller.currentFileIndex.value =
                                    controller.player.currentIndex!;
                              },
                              child: Obx(
                                () => Icon(
                                  controller.playState.value
                                      ? Icons.pause_circle_filled
                                      : Icons.play_circle_fill,
                                  size: 48,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await controller.player.seekToPrevious();
                                
                                controller.currentFileIndex.value =
                                    controller.player.currentIndex!;
                                    controller.timerCheck();
                              },
                    
                              child: Icon(
                                Icons.skip_previous,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            SizedBox(),
                            GestureDetector(
                              onTap: () async {
                    
                                 controller.setLoopMode();
                    
                              },
                    
                              child: Icon(Icons.repeat,color: 
                                controller.isLoopAll.value?const Color.fromARGB(255, 19, 96, 160):Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
