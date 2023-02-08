import 'package:get/get.dart';
import 'package:udemy_clone_ui/signin/signin_controller.dart';

class SignInBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SignInController());
  }

}