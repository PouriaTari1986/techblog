
class ApiUrlConstant {
ApiUrlConstant._();
static const String baseUrl = 'https://techblog.sasansafari.com/Techblog/api/';
static const String hostDlUrl = 'https://techblog.sasansafari.com';
static const String getHomeItems = "${baseUrl}home/?command=index";
static const String getArticleList = "${baseUrl}article/get.php?command=new&user_id=";
static const String publisheArticle = "${baseUrl}article/get.php?command=published_by_me&user_id=";
static const String storeArticle = "${baseUrl}article/post.php";
static const String favoritesPodcasts = "${baseUrl}podcast/get.php?command=favorites&user_id=";
static const String getPodcasts = "${baseUrl}podcast/get.php?command=get_files&podcats_id=";

static const String postRegiter = "https://techblog.sasansafari.com/Techblog/api/register/action.php";


}   

class ApiKeyArticleConstant {


static const title = "title";
static const content = "content";
static const catID = "cat_id";
static const userId = "user_id";
static const image = "image";
static const command = "command";
static const tagList = "tag_list";




}//https://techblog.sasansafari.com/Techblog/api/podcast/get.php?command=get_files&podcats_id=25
