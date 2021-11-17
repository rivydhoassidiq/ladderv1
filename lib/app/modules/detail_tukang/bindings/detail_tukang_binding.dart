import 'package:get/get.dart';

import '../controllers/detail_tukang_controller.dart';

class DetailTukangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailTukangController>(
      () => DetailTukangController(),
    );
  }
}
