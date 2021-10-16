import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ladder/app/utils/theme.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: blueBackgroundColor,
        body: SafeArea(
          child: Center(
            child: Container(
              width: Get.width * 0.3,
              height: Get.width * 0.3,
              child: Image.asset('assets/images/splash.png'),
            ),
          ),
        ),
      ),
    );
  }
}
