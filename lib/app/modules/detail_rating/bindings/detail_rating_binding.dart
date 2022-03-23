import 'package:get/get.dart';

import '../controllers/detail_rating_controller.dart';

class DetailRatingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailRatingController>(
      () => DetailRatingController(),
    );
  }
}
