import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ladder/app/utils/theme.dart';

import '../controllers/pesan_sekarang_controller.dart';

class PesanSekarangView extends GetView<PesanSekarangController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
        title: Text(
          'Pesan Sekarang',
          style: boldText16.copyWith(color: blackColor),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        padding: EdgeInsets.only(top: 16, bottom: 4, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 44,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: blueColorColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
                child: Text(
                  'Konfirmasi',
                  style: boldText16.copyWith(color: whiteColor),
                ),
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dengan konfirmasi order, anda menyetujui',
                  style: semiBoldText10.copyWith(color: blackColor),
                ),
                SizedBox(width: 8),
                Text(
                  'Syarat & Ketentuan',
                  style: semiBoldText10.copyWith(color: blueColorColor),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(),
          ],
        ),
      ),
    );
  }
}
