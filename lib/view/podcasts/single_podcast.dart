import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog/component/constant/decoration.dart';
import 'package:my_blog/component/constant/my_colors.dart';
import 'package:my_blog/component/constant/my_componnent.dart';
import 'package:my_blog/component/constant/my_strings.dart';
import 'package:my_blog/component/dimens.dart';
import 'package:my_blog/gen/assets.gen.dart';
import 'package:my_blog/view/podcasts/podcast_list_screen.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';
import 'package:share_plus/share_plus.dart';



class SinglePodcast extends StatelessWidget {
   const SinglePodcast({super.key});

  @override
  Widget build(BuildContext context) {

    
    var textTheme = Theme.of(context).textTheme;
    return
    SafeArea(
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
                    CachedNetworkImage(
                      imageUrl: 
                      '',
                      imageBuilder: ((context, imageProvider) =>
                          Image(image: imageProvider)),
                                   
                      placeholder: (context, url) =>
                          Loading(),
                      errorWidget: (context, url, error) =>
                          Assets.images.singlePlaceHolder.image(),
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
                              onTap: () => Get.to(PodcatsListScreen()),
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
                              onTap: () async=> await SharePlus.instance.share(
                                ShareParams(text: "لذت ببرید")
                              ),
                              child: InkWell(
                                onTap: ()async=>await SharePlus.instance.share(ShareParams(
                                  text: MyStrings.shareText
                                )),
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
                          "عنوان پادکست",
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
                            "پوریا",
                            style: textTheme.titleSmall,
                          ),
                          
                        ],
                      ),
                    ),
                                   
                   
                    
                                   ],
                            ),
                                   
                                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context,index){
                    
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            
                                                  
                            Row(children: [
                                                  
                              Assets.icons.podcast.image(height: 35,color: SolidColors.seeMore),
                              SizedBox(width: 8,),
                              Text(";sn;nv;nzdofndn;n;ldnng;sng;"),
                                                  
                             
                            ],),
                             Text("data")
                          ],),
                        );
                      }),
                                   )
                    ],
                                   ),
                                 ),
                 ),
                 Positioned(
            bottom: 12,
            right: Dimens.bodyMargin,
            left: Dimens.bodyMargin,
            child: 
            Container(
              height: Get.height/8,
              decoration: MyDecoration.mainGradiant,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                      LinearPercentIndicator(
                        percent: 1.0,
                        backgroundColor: Colors.white,
                        progressColor: Colors.orange,
                        
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                
                          Icon(Icons.skip_next,color: Colors.white,size: 30,),
                
                          Icon(Icons.play_circle_fill,color: Colors.white,size: 48,),
                
                          Icon(Icons.skip_previous,color: Colors.white,size: 30,),
                          SizedBox(),
                          Icon(Icons.repeat,color: Colors.white,),
                        ],
                      )
                    
                  ],
                ),
              ),
            )
            )
              ]
            ),
      
            
          
          
        )
          );
        
  
      
    

}
}