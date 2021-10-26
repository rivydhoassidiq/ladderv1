import 'package:get/get.dart';

import '../controllers/pesan_sekarang_controller.dart';

class PesanSekarangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PesanSekarangController>(
      () => PesanSekarangController(),
    );
  }
}
