import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:video_player/video_player.dart';

class LearnController extends GetxController {
  VideoPlayerController? videoController;
  bool isFullScreen = false;
  bool? isPaused;
  String? startTime = "";
  String? endTime = "";

 List<Map<String,dynamic>> listMap=[
   {
     "introduction":"introduction description",
     "introductionUrl":"Url"
   },{
     "introduction":"introduction description",
     "introductionUrl":"Url"
   },
   {
     "introduction":"introduction description",
     "introductionUrl":"Url",
   },
   {
     "introduction":"introduction description",
     "introductionUrl":"Url",
   },
   {
     "introduction":"introduction description",
     "introductionUrl":"Url",
   },
 ];


  @override
  void onInit() {
    videoInitialization();
    videoController?.addListener(() {});
    update();
    super.onInit();
  }

   updateUiWidth(double widthSize) {
    double width = Get.width * widthSize;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      update();
    });

    return width;
  }

  videoInitialization() async {
    var url =
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";
    videoController = VideoPlayerController.network(
      url,
    );
    await videoController?.initialize();
     await videoController?.play();
    // await videoController?.seekTo(60.seconds);
    videoController?.setLooping(false);
    update();
  }

  void fullScreen() {
    isFullScreen = !isFullScreen;
    update();
  }

  playPauseVideo(bool isPlaying) {
    isPaused = !isPlaying;
    videoController!.value.isPlaying
        ? videoController?.pause()
        : videoController?.play();
    update();
  }
}
