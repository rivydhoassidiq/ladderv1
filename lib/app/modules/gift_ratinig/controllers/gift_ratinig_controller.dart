import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GiftRatinigController extends GetxController {
  TextEditingController komenC = TextEditingController();

  @override
  void onInit() {
    komenC;
  }

  @override
  void onClose() {
    komenC.dispose();
  }
}
