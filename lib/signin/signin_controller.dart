

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:udemy_clone_ui/home/home_screen.dart';
import 'package:udemy_clone_ui/routes/appRoutes.dart';

class SignInController extends GetxController{
TextEditingController userNameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
 GlobalKey<FormState> formKey = GlobalKey();


  loginData()async{
    if(formKey.currentState!.validate()){
    Get.toNamed(AppRoutes.home);

    }
  }
}