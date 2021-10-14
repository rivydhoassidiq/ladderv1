import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroductionScreenController extends GetxController {
  PageController controller = PageController(initialPage: 0);

  @override
  void onInit() {
    controller;
    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
