import 'package:get/get.dart';
import 'learn_controller.dart';

class LearnBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LearnController());
  }
}
