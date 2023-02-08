import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_clone_ui/learn/learn_controller.dart';
import 'package:udemy_clone_ui/routes/appRoutes.dart';

AppBar appBar(String route, {LearnController? controller}) {
  return AppBar(
    title: Center(
      child: SizedBox(
        width: Get.width * 0.4,
        child: TextFormField(
          onEditingComplete: () {
            route == AppRoutes.learn
                ? controller?.videoController?.pause()
                : null;
          },
          decoration: InputDecoration(
            prefixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ),
        ),
      ),
    ),
    leading: Center(
      child: InkWell(
        onTap: () {
          Get.toNamed(AppRoutes.home);
          route == AppRoutes.learn
              ? controller?.videoController?.pause()
              : null;
        },
        child: const Text("Udemy"),
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          route == AppRoutes.learn
              ? controller?.videoController?.pause()
              : null;
        },
        icon: const Icon(Icons.shopping_cart),
      ),
      route != AppRoutes.myLearnings
          ? MaterialButton(
              onPressed: () {
                Get.toNamed(AppRoutes.myLearnings);
                route == AppRoutes.learn
                    ? controller?.videoController?.pause()
                    : null;
              },
              child: const Text("My Learnings"),
            )
          : const SizedBox(),
      route != AppRoutes.signIn
          ? MaterialButton(
              onPressed: () {
                Get.toNamed(AppRoutes.signIn);
                route == AppRoutes.learn
                    ? controller?.videoController?.pause()
                    : null;
              },
              child: const Text("Login"),
            )
          : const SizedBox(),
      MaterialButton(
        onPressed: () {
          route == AppRoutes.learn
              ? controller?.videoController?.pause()
              : null;
          // Get.toNamed(AppRoutes.signUP);
        },
        child: const Text("Sign Up"),
      )
    ],
  );
}

class AnimatedPlayPause extends StatefulWidget {
  const AnimatedPlayPause({
    Key? key,
    required this.playing,
    this.size,
    this.color,
  }) : super(key: key);

  final double? size;
  final bool playing;
  final Color? color;

  @override
  State<StatefulWidget> createState() => AnimatedPlayPauseState();
}

class AnimatedPlayPauseState extends State<AnimatedPlayPause>
    with SingleTickerProviderStateMixin {
  late final animationController = AnimationController(
    vsync: this,
    value: widget.playing ? 1 : 0,
    duration: const Duration(milliseconds: 400),
  );

  @override
  void didUpdateWidget(AnimatedPlayPause oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.playing != oldWidget.playing) {
      if (widget.playing) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedIcon(
        color: widget.color,
        size: widget.size,
        icon: AnimatedIcons.play_pause,
        progress: animationController,
      ),
    );
  }
}
