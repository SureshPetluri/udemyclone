import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../routes/appRoutes.dart';
import '../utils/customWidgets.dart';
import 'learn_controller.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LearnController>(
      init: LearnController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              controller.videoController?.pause();
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: AppBarCont(route: AppRoutes.learn, controller: controller),
        ),
        body: !controller.isFullScreen && Get.width > 550
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 6,
                    child: ClipRect(
                      clipBehavior: Clip.hardEdge,
                      child: Container(
                        width: double.infinity,
                        height: controller.isFullScreen
                            ? Get.height
                            : Get.height * 0.7,
                        alignment: Alignment.topLeft,
                        child: AspectRatio(
                          aspectRatio:
                              controller.videoController!.value.aspectRatio,
                          child: buildVideoPlayer(controller),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: ListView.builder(
                      itemCount: controller.listMap.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: InkWell(
                            child: const ListTile(
                              title: Text(
                                  "Section 1: Introduction & The Course Outline"),
                              subtitle: Text("0/1|3 min"),
                            ),
                            onTap: () {},
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    ClipRect(
                      clipBehavior: Clip.hardEdge,
                      child: Container(
                        width: double.infinity,
                        // height:
                        //     controller.isFullScreen ? Get.height : Get.height * 0.7,
                        alignment: Alignment.topLeft,
                        child: AspectRatio(
                          aspectRatio:
                              controller.videoController!.value.aspectRatio,
                          child: buildVideoPlayer(controller),
                        ),
                      ),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.listMap.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: InkWell(
                            child: const ListTile(
                              title: Text(
                                  "Section 1: Introduction & The Course Outline"),
                              subtitle: Text("0/1|3 min"),
                            ),
                            onTap: () {},
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
      ),
    );
  }

  Widget buildVideoPlayer(LearnController controller) {
    ///updateUiWidth renders the screen every Time
    controller.updateUiWidth(1.0);
    String? startTime =
        controller.videoController?.value.position.toString().split(".")[0];
    String? endTime =
        controller.videoController?.value.duration.toString().split(".")[0];

    return buildVideoContainerStack(controller, startTime, endTime);
  }

  FutureBuilder buildVideoContainerStack(
      LearnController controller, String? startTime, String? endTime) {
    return FutureBuilder(
      future: controller.initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(children: [
            VideoPlayer(controller.videoController!),
            Positioned(
              bottom: controller.isFullScreen ? 25 : 35,
              left: 1,
              right: 1,
              child: VideoProgressIndicator(
                controller.videoController!,
                allowScrubbing: true,
                colors: const VideoProgressColors(
                    backgroundColor: Colors.blueGrey,
                    bufferedColor: Colors.blueGrey,
                    playedColor: Colors.blueAccent),
              ),
            ),
            Positioned(
              bottom: controller.isFullScreen ? 5 : 15,
              left: 25,
              right: 20,
              child: Text("$startTime/$endTime"),
            ),
            Positioned(
                bottom: controller.isFullScreen ? 2 : 12,
                left: 2,
                child: InkWell(
                  radius: 0.0,
                  child: AnimatedPlayPause(
                    playing: controller.isPaused =
                        controller.videoController!.value.isPlaying,
                  ),
                  onTap: () {
                    controller.playPauseVideo(
                        controller.videoController!.value.isPlaying);
                  },
                )),
            Positioned(
              bottom: controller.isFullScreen ? 2 : 12,
              right: 20,
              child: InkWell(
                child: controller.isFullScreen
                    ? const Icon(Icons.fullscreen_exit)
                    : const Icon(Icons.fullscreen),
                onTap: () {
                  controller.fullScreen();
                  // controller.videoController?.play();
                },
              ),
            ),
          ]);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}