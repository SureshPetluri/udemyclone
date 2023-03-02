import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../repositories/sign_in_repository.dart';


class LoginController extends GetxController with GetTickerProviderStateMixin {
  AnimationController? _controller;
  late Animation<double> scaleAnimation;

  GlobalKey<FormState> formKey =GlobalKey();
  GlobalKey<FormState> signUPFormKey =GlobalKey();

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpMobileController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();
  String? verificationId;

  bool showLoading = false;

  @override
  void onInit() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 700), vsync: this);
    scaleAnimation =
        CurvedAnimation(parent: _controller!, curve: Curves.easeInOut);

    _controller?.addListener(() {
      update();
    });

    _controller?.forward();
    super.onInit();
  }


  loginValidations(BuildContext context){
    if(formKey.currentState!.validate()){
      inToHomeLogIn(context);
      SignInRepository.loginComplete("completed");
      update();
    }
  }


  signUpValidations(BuildContext context){
    if(signUPFormKey.currentState!.validate()){
      inToHomeLogIn(context);
      SignInRepository.loginComplete("completed");
      update();
    }
  }

  inToHomeLogIn(BuildContext context) async {
    _controller =
        AnimationController(duration: const Duration(milliseconds: 700), vsync: this);
    scaleAnimation =
        CurvedAnimation(parent: _controller!, curve: Curves.easeInOut);

    _controller?.addListener(() {
      update();
    });
    await _controller?.reverse(from: 1.0);
    update();
      Get.back(canPop : true);
  }
  String setPage = "Login";

 String screenSet(String name){
   setPage = name;
   update();
   return setPage;
  }

}