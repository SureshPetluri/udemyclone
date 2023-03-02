import 'package:get/get.dart';

import 'card_controller.dart';


class CardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CardController());
  }
}