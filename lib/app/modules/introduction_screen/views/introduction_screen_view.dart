import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ladder/app/modules/introduction_screen/controllers/introduction_screen_controller.dart';
import 'package:ladder/app/routes/app_pages.dart';
import 'package:ladder/app/utils/theme.dart';

import 'onboarding_contemt.dart';

class IntroductionScreenView extends StatefulWidget {
  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreenView> {
  int currentIndex = 0;

  final _authController = Get.find<IntroductionScreenController>();

  // @override
  // void initState() {
  //   _controller;
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  List<OnBoardingContent> contents = [
    OnBoardingContent(
      title: 'Pelayanan Terbaik',
      image: 'assets/images/splash1.png',
      deskrip: 'Kami akan memberikan pelayanan terbaik untuk anda.',
    ),
    OnBoardingContent(
      title: ' Profesionalitas',
      image: 'assets/images/splash2.png',
      deskrip: 'Pekerja kami memiliki profil yang transparan dan terlatih.',
    ),
    OnBoardingContent(
      title: 'Pasti Beres',
      image: 'assets/images/splash3.png',
      deskrip: 'Dan tentunya, pasti beres!.',
    )
  ];
  // List<OnBoardingContent> contents = [];

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: whiteColor,
      body: PageView.builder(
        controller: _authController.controller,
        itemCount: contents.length,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (_, i) {
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: mediaQueryHeight * 0.6,
                  width: mediaQueryWidth * 1,
                  // color: Colors.amber,
                  child: Column(
                    children: [
                      Image.asset(
                        contents[i].image,
                        alignment: Alignment.center,
                        width: 312,
                        height: 320,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          contents.length,
                          (index) => buildDot(index, context),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(contents[i].title, style: boldText16),
                      const SizedBox(height: 16),
                      Container(
                        // color: Colors.amber,
                        width: 312,
                        height: 44,
                        child: Text(contents[i].deskrip,
                            textAlign: TextAlign.center,
                            style: semiBoldText12.copyWith(color: sliderColor)),
                      ),
                    ],
                  ),
                ),
                Container(
                  // color: Colors.red,
                  height: mediaQueryHeight * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // BUTTON LEWATI
                      Container(
                        width: 122,
                        height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: whiteColor,
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () => Get.offAllNamed(Routes.LOGIN),
                            child: Center(
                              child: Text('Lewati',
                                  style: boldText16.copyWith(color: pinkColor)),
                            ),
                          ),
                        ),
                      ),
                      // BUTTON LANJUTKAN
                      Container(
                        width: 122,
                        height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: blueColorColor,
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              if (currentIndex == contents.length - 1) {
                                Get.offAllNamed(Routes.LOGIN);
                              }
                              _authController.controller.nextPage(
                                  duration: Duration(milliseconds: 100),
                                  curve: Curves.bounceIn);
                            },
                            child: Center(
                              child: Text('Lanjutkan',
                                  style:
                                      boldText16.copyWith(color: whiteColor)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 8,
      width: currentIndex == index ? 10 : 10,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: currentIndex == index ? blueColorColor : sliderColor2,
      ),
    );
  }
}
