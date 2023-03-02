import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../repositories/sign_in_repository.dart';


class CardController extends GetxController with GetTickerProviderStateMixin {
  AnimationController? _controller;
  late Animation<double> scaleAnimation;

  GlobalKey<FormState> cardFormKey =GlobalKey();

  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController cvcController = TextEditingController();
  TextEditingController expYearController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
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




  cardValidations(BuildContext context){
    if(cardFormKey.currentState!.validate()){
      inToHomeLogIn(context);

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