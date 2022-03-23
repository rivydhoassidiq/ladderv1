import 'package:get/get.dart';

import '../controllers/gift_ratinig_controller.dart';

class GiftRatinigBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GiftRatinigController>(
      () => GiftRatinigController(),
    );
  }
}
