import 'package:get/get.dart';
import 'package:udemy_clone_ui/home/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
  }

}