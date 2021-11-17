import 'package:get/get.dart';

import '../controllers/pilih_tukang_controller.dart';

class PilihTukangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PilihTukangController>(
      () => PilihTukangController(),
    );
  }
}
