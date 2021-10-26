import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ladder/app/routes/app_pages.dart';
import 'package:ladder/app/utils/theme.dart';

class CleaningPage extends StatelessWidget {
  const CleaningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;

    final widthC = sizeWidth;
    final heightC = sizeHeight;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
        title: Text(
          'Cleaning',
          style: boldText16.copyWith(color: blackColor),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: sizeWidth,
          height: sizeHeight,
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          // color: Colors.amber,
          child: Column(
            children: [
              Container(
                width: sizeWidth,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => Get.toNamed(Routes.SERVICE_DETAIL),
                        child: Card(
                          elevation: 2,
                          child: Column(
                            children: [
                              Container(
                                width: Get.width,
                                // color: Colors.amber,
                                child: Image.asset(
                                  'assets/images/toilet3.png',
                                  // width: 156,
                                  // height: 120,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 12.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Toilet',
                                      style: semiBoldText14.copyWith(
                                          color: blackColor),
                                    ),
                                    SizedBox(width: 50),
                                    Image.asset(
                                      'assets/icons/komen.png',
                                      width: 13,
                                      height: 13,
                                    ),
                                    SizedBox(width: 8),
                                    Text('50', style: regularText12),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, bottom: 12.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Color(0xFFFFC107),
                                      size: 16,
                                    ),
                                    SizedBox(width: 5),
                                    Text('4.0', style: regularText12),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Card(
                        elevation: 2,
                        child: Column(
                          children: [
                            Container(
                              width: Get.width,
                              child: Image.asset(
                                'assets/images/cuci_tandon.png',
                                // width: 156,
                                // height: 120,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 12.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Tandon Air',
                                    style: semiBoldText14.copyWith(
                                        color: blackColor),
                                  ),
                                  SizedBox(width: 20),
                                  Image.asset(
                                    'assets/icons/komen.png',
                                    width: 13,
                                    height: 13,
                                  ),
                                  SizedBox(width: 8),
                                  Text('50', style: regularText12),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, bottom: 12.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color(0xFFFFC107),
                                    size: 16,
                                  ),
                                  SizedBox(width: 5),
                                  Text('4.0', style: regularText12),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: sizeWidth,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Card(
                        elevation: 2,
                        child: Column(
                          children: [
                            Container(
                              child: Image.asset(
                                'assets/images/cuci_ac3.png',
                                // width: 156,
                                // height: 120,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 12.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Cuci AC',
                                    style: semiBoldText14.copyWith(
                                        color: blackColor),
                                  ),
                                  SizedBox(width: 75),
                                  Image.asset(
                                    'assets/icons/komen.png',
                                    width: 13,
                                    height: 13,
                                  ),
                                  SizedBox(width: 8),
                                  Text('50', style: regularText12),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, bottom: 12.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color(0xFFFFC107),
                                    size: 16,
                                  ),
                                  SizedBox(width: 5),
                                  Text('4.0', style: regularText12),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Opacity(
                        opacity: 0,
                        child: Card(
                          elevation: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/images/pompa_air.png',
                                  // width: 156,
                                  // height: 120,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 12.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Pompa Air',
                                      style: semiBoldText14.copyWith(
                                          color: blackColor),
                                    ),
                                    SizedBox(width: 23),
                                    Image.asset(
                                      'assets/icons/komen.png',
                                      width: 13,
                                      height: 13,
                                    ),
                                    SizedBox(width: 8),
                                    Text('50', style: regularText12),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, bottom: 12.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Color(0xFFFFC107),
                                      size: 16,
                                    ),
                                    SizedBox(width: 5),
                                    Text('4.0', style: regularText12),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
