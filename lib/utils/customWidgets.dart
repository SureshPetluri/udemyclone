import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../learn/learn_controller.dart';
import '../repositories/sign_in_repository.dart';
import '../routes/appRoutes.dart';
import '../signin/signin_view.dart';

/*AppBar appBar(String route,
    {LearnController? controller, String? authComplete}) {
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
        child: const Text("Jnanam"),
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
      route != AppRoutes.signIn && SignInRepository.complete() != "completeds"
          ? MaterialButton(
              onPressed: () {
                Get.dialog(const LoginScreen());
                route == AppRoutes.learn
                    ? controller?.videoController?.pause()
                    : null;
              },
              child: const Text("Login"),
            )
          : const Text("Completed"),
      // MaterialButton(
      //   onPressed: () {
      //     route == AppRoutes.learn
      //         ? controller?.videoController?.pause()
      //         : null;
      //     // Get.toNamed(AppRoutes.signUP);
      //   },
      //   child: const Text("Sign Up"),
      // )
      */ /*StatefulBuilder(
      builder: (BuildContext context, setState)=> Row(
    children: [
        InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.home);
            route == AppRoutes.learn
                ? controller?.videoController?.pause()
                : null;
          },
          child: const Text("Jnanam"),
        ),
        Center(
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
        route != AppRoutes.signIn && authComplete != "completed"
            ? MaterialButton(
                onPressed: () {
                  Get.dialog(const LoginScreen());
                  route == AppRoutes.learn
                      ? controller?.videoController?.pause()
                      : null;
                },
                child: const Text("Login"),
              )
            : const Text("Completed"),
        // MaterialButton(
        //   onPressed: () {
        //     route == AppRoutes.learn
        //         ? controller?.videoController?.pause()
        //         : null;
        //     // Get.toNamed(AppRoutes.signUP);
        //   },
        //   child: const Text("Sign Up"),
        // )
    ],
  ),
      )*/ /*
    ],
  );
}
*/
class AppBarCont extends StatefulWidget {
  const AppBarCont({this.controller, required this.route, Key? key})
      : super(key: key);
  final String route;
  final LearnController? controller;

  @override
  State<AppBarCont> createState() => _AppBarContState();
}

class _AppBarContState extends State<AppBarCont> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Get.offAllNamed(AppRoutes.home);
            widget.route == AppRoutes.learn
                ? widget.controller?.videoController?.pause()
                : null;
          },
          child: const Text("Jnanam"),
        ),
        const Spacer(),
        Center(
          child: SizedBox(
            width: Get.width * 0.4,
            child: TextFormField(
              onEditingComplete: () {
                widget.route == AppRoutes.learn
                    ? widget.controller?.videoController?.pause()
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
        const Spacer(),
        SignInRepository.complete()=="completed" ? IconButton(
          onPressed: () {
            widget.route == AppRoutes.learn
                ? widget.controller?.videoController?.pause()
                : null;
          },
          icon: const Icon(Icons.shopping_cart),
        ):SizedBox(),
        ValueListenableBuilder(
          builder: (_, value, ___) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              setState(() {});
            });

            return widget.route != AppRoutes.signIn && value != "completed"
                ? MaterialButton(
                    onPressed: () {
                      Get.dialog(const LoginScreen());
                      widget.route == AppRoutes.learn
                          ? widget.controller?.videoController?.pause()
                          : null;
                    },
                    child: const Text("Login"),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTapDown: (details) {
                         overLayUserInfo(
                          context,
                          details,
                          widget.route,
                          widget.controller,
                        );



                        // overLayUserInfo();
                      },
                      child: CircleAvatar(
                          child: Text("P"),
                          backgroundColor: Colors.deepPurpleAccent,
                          radius: 18),
                    ),
                  );
          },
          valueListenable: ValueNotifier(SignInRepository.complete()),
        ),

        // MaterialButton(
        //   onPressed: () {
        //     route == AppRoutes.learn
        //         ? controller?.videoController?.pause()
        //         : null;
        //     // Get.toNamed(AppRoutes.signUP);
        //   },
        //   child: const Text("Sign Up"),
        // )
      ],
    );
  }
}
Offset? position;
OverlayEntry? overlayEntry;

overLayUserInfo(BuildContext context, TapDownDetails details, String? route,
    LearnController? controller) async {
  // await getUserInfoDetails(userID.toString());
  position = details.globalPosition;
  print("Before scrol...${position?.dy}");
  OverlayState overlayState = Overlay.of(context);

  overlayEntry = OverlayEntry(builder: (context) {
    return UserSet(
      overlayEntry: overlayEntry,
      position: details.globalPosition,
      route: route,
      controller: controller,
    );
  });
  // Inserting the OverlayEntry into the Overlay
  overlayState.insert(overlayEntry!);
  // moreInfo = false;

  // update();
}

class UserSet extends StatelessWidget {
  const UserSet( {required this.position, this.route, this.controller,this.overlayEntry, Key? key})
      : super(key: key);
  final Offset position;
  final String? route;
  final LearnController? controller;
  final OverlayEntry? overlayEntry;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: position.dy - 20,
      top: position.dy + 20,
      child: Card(
        child: Container(
          color: Colors.white38,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MaterialButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.myLearnings);

                  route == AppRoutes.learn
                      ? controller?.videoController?.pause()
                      : null;
                   overlayEntry?.remove();
                },
                child: buildText("My Learnings"),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  SignInRepository.loginComplete("Log Out");
                  overlayEntry?.remove();
                  controller?.videoController?.pause();
                  Get.offAllNamed(AppRoutes.home);
                },
                child: buildText("Log Out"),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.myLearnings);
                  route == AppRoutes.learn
                      ? controller?.videoController?.pause()
                      : null;
                  overlayEntry?.remove();
                },
                child: buildText("My Learnings"),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.myLearnings);
                  route == AppRoutes.learn
                      ? controller?.videoController?.pause()
                      : null;
                  overlayEntry?.remove();
                },
                child: buildText("My Learnings"),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.myLearnings);
                  route == AppRoutes.learn
                      ? controller?.videoController?.pause()
                      : null;
                  overlayEntry?.remove();
                },
                child: buildText("My Learnings"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text buildText(String text) => Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 14),
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
