import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangeProfileController extends GetxController {
  TextEditingController namaC = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController noTelpC = TextEditingController();
  TextEditingController emailC = TextEditingController();

  @override
  void onInit() {
    namaC;
    noTelpC;
    emailC;
    super.onInit();
  }

  @override
  void onClose() {
    namaC.dispose();
    noTelpC.dispose();
    emailC.dispose();
    super.dispose();
  }
}
