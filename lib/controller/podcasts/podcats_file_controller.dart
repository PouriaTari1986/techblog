
import 'dart:async';

import 'package:get/get.dart';
import 'package:my_blog/component/api_constant.dart';
import 'package:my_blog/models/podcast_file_model.dart';
import 'package:my_blog/services/dio_service.dart';
import 'package:just_audio/just_audio.dart';

class SinglePodcastController extends GetxController {
  var id;

  SinglePodcastController({this.id});

  RxBool loading = false.obs;

  RxList<PodcastFileModel> podcastEpisodeList = RxList();

  final player = AudioPlayer();
  late var playList;
  RxBool playState = false.obs;
  RxInt currentFileIndex = 0.obs;
  RxBool isLoopAll = false.obs;



  @override
  onInit() async {
    super.onInit();
    playList = <AudioSource>[];
    await getPodcastFiles();
    await player.setAudioSources(
      playList,
      initialIndex: 0,
      initialPosition: Duration.zero,
    );
  }

  Future<void> getPodcastFiles() async {
    loading.value = true;

    var response = await DioService().getMethod(
      ApiUrlConstant.getPodcasts + id,
    );

    if (response.statusCode == 200) {
      for (var element in response.data["files"]) {
        podcastEpisodeList.add(PodcastFileModel.fromJson(element));
        playList.add(
          AudioSource.uri(Uri.parse(PodcastFileModel.fromJson(element).file!)),
        );
      }
      loading.value = false;
    }
  }

  Rx<Duration> progressValue = Duration(seconds: 0).obs;
  Rx<Duration> bufferedValue = Duration(seconds: 0).obs;

  Timer? timer;

  void startProgress() {
    const tick = Duration(seconds: 1);

    int duration = player.duration!.inSeconds - player.position.inSeconds;

    if (timer != null) {
      if (timer!.isActive) {
        timer!.cancel();
        timer = null;
      }
    }
    timer = Timer.periodic(tick, (timer) {
      duration--;
      progressValue.value = player.position;
      bufferedValue.value = player.bufferedPosition;
      if (duration <= 0) {
        timer.cancel();
        progressValue.value = Duration(seconds: 0);
        bufferedValue.value = Duration(seconds: 0);
      }
    });
  }

void timerCheck(){

  if(player.playing){
    startProgress();
  }else{
    timer!.cancel();
    progressValue.value = Duration(seconds: 0);
    bufferedValue.value = Duration(seconds: 0);

  }

}

  void setLoopMode(){

    if(isLoopAll.value){
      isLoopAll.value = false;
      player.setLoopMode(LoopMode.off);
    }else{
      isLoopAll.value = true;
      player.setLoopMode(LoopMode.all);
    }

  }
}
