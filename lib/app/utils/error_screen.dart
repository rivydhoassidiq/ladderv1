import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ladder/app/utils/theme.dart';
import 'package:lottie/lottie.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
          child: Center(
            child: Lottie.asset(
              'assets/lottie/error_internet.json',
              width: Get.width * 0.5,
              height: Get.width * 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
