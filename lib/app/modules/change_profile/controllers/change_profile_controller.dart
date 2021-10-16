import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangeProfileController extends GetxController {
  TextEditingController namaC = TextEditingController(text: 'Shin Jiyoon');
  TextEditingController noTelpC = TextEditingController(text: '+6289695704282');
  TextEditingController emailC =
      TextEditingController(text: 'shinjiyoon@gmail.com');

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
