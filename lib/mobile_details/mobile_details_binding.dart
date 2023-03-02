
import 'package:get/get.dart';

import 'mobile_details_controller.dart';

class MobileDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MobileDetailsController());
  }

}