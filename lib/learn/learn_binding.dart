import 'package:get/get.dart';
import 'package:udemy_clone_ui/learn/learn_controller.dart';

class LearnBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LearnController());
  }
}
