


import 'package:get/get.dart';
import 'package:my_blog/route_manager/binding.dart';
import 'package:my_blog/route_manager/names.dart';
import 'package:my_blog/view/article/manage_article.dart';
import 'package:my_blog/view/article/single_article_screen.dart';
import 'package:my_blog/view/article/single_manage_article.dart';
import 'package:my_blog/view/main_screen/main_screen.dart';
import 'package:my_blog/view/podcasts/podcast_list_screen.dart';
import 'package:my_blog/view/podcasts/single_podcast.dart';
import 'package:my_blog/view/splash_screen.dart';

class Pages {

Pages._();
static List<GetPage<dynamic>> pages =[


GetPage(
          name: NamedRoute.initialRoute,
          page: (() => SplashScreen()),
        ),

GetPage(
          name: NamedRoute.routMainScreen,
          page: (() => MainScreen()),
          binding: RegisterBinding(),
        ),

        GetPage(
          name: NamedRoute.routeSingleArticle,
          page: (() => SingleArticleScreen()),
          binding: ArticleBinding(),
        ),
        GetPage(
          name: NamedRoute.managedArtice,
          page: (() => ManagedArticle()),
          binding: ArticleManagerBinding(),
        ),
        GetPage(
          name: NamedRoute.singleManageArticle,
          page: (() => SingleManageArticle()),
          binding: ArticleManagerBinding(),
        ),
        GetPage(
          name: NamedRoute.singlePodcast,
          page: (() => SinglePodcast()),
         
        ),
        GetPage(
          name: NamedRoute.podcastList,
          page: (() => PodcatsListScreen(title: '',)),
         
        ),


];



}