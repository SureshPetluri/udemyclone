import 'package:get/get.dart';

import 'my_learnings_controller.dart';

class MyLearningsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MyLearningsController());
  }

}