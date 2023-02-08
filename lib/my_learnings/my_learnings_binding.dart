import 'package:get/get.dart';
import 'package:udemy_clone_ui/my_learnings/my_learnings_controller.dart';

class MyLearningsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MyLearningsController());
  }

}