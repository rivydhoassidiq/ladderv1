import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ladder/app/data/models/tukang.dart';
import 'package:ladder/app/routes/app_pages.dart';
import 'package:ladder/app/utils/theme.dart';

import '../controllers/detail_tukang_controller.dart';

class DetailTukangView extends GetView<DetailTukangController> {
  // final TukangModel tukang;

  // DetailTukangView(this.tukang);
  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;

    final widthC = sizeWidth;
    final heightC = sizeHeight;
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
          'Detail Tukang',
          style: boldText16.copyWith(color: blackColor),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        height: 76,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: sliderColor)),
        ),

        // color: Colors.green,
        child: Container(
          decoration: BoxDecoration(
            color: blueColorColor,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              onTap: () => Get.toNamed(Routes.CHAT_ROOM),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/chat.png',
                      color: whiteColor,
                      width: 16,
                      height: 16,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Chat',
                      style: boldText16.copyWith(color: whiteColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
          future: controller.getData(Get.arguments),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // var listAllDocs = snapshot.data!.docs;
              var data = snapshot.data!.data() as Map<String, dynamic>;
              var nameC = data["name"];
              var photoUrl = data["photoUrl"];
              return Container(
                width: sizeWidth,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                top: 16,
                                left: 16,
                                right: 16,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: Get.width * 0.25,
                                    height: Get.width * 0.25,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        // 'https://1409791524.rsc.cdn77.org/data/images/full/567629/blackpink-jisoo-all-black-hip-style-lovely-is-a-bonus.jpg',
                                        photoUrl,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // '${(listAllDocs as Map<String, dynamic>)["name"]}',
                                        nameC,
                                        style: semiBoldText14.copyWith(
                                            color: blackColor),
                                      ),
                                      SizedBox(height: 14),
                                      Text(
                                        '40 Tahun',
                                        style: regularText12,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                top: 16,
                                left: 16,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Pekerjaan yang dikuasai',
                                      style: boldText14.copyWith(
                                          color: blackColor)),
                                  SizedBox(height: 16),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: Get.width * 0.3,
                                          width: Get.width * 0.3,
                                          padding: EdgeInsets.only(
                                            top: 16,
                                            bottom: 24,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFEFDF5),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/icons/air_conditioner.png',
                                                height: 42,
                                                width: 42,
                                              ),
                                              SizedBox(height: 16),
                                              Text(
                                                'Air Conditioner',
                                                style: semiBoldText12.copyWith(
                                                    color: blackColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 16),
                                        Container(
                                          height: Get.width * 0.3,
                                          width: Get.width * 0.3,
                                          padding: EdgeInsets.only(
                                            top: 16,
                                            bottom: 24,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFEFDF5),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/icons/air_conditioner.png',
                                                height: 42,
                                                width: 42,
                                              ),
                                              SizedBox(height: 16),
                                              Text(
                                                'Air Conditioner',
                                                style: semiBoldText12.copyWith(
                                                    color: blackColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 16),
                                        Container(
                                          height: Get.width * 0.3,
                                          width: Get.width * 0.3,
                                          padding: EdgeInsets.only(
                                            top: 16,
                                            bottom: 24,
                                          ),
                                          decoration: BoxDecoration(
                                            color: cardACColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/icons/ac_cuci.png',
                                                height: 42,
                                                width: 42,
                                              ),
                                              SizedBox(height: 16),
                                              Text(
                                                'Cuci Ac',
                                                style: semiBoldText12.copyWith(
                                                    color: blackColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 16),
                                        Container(
                                          height: Get.width * 0.3,
                                          width: Get.width * 0.3,
                                          padding: EdgeInsets.only(
                                            top: 16,
                                            bottom: 24,
                                          ),
                                          decoration: BoxDecoration(
                                            color: cardPColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/icons/plumb.png',
                                                height: 42,
                                                width: 42,
                                              ),
                                              SizedBox(height: 16),
                                              Text(
                                                'Plumbing',
                                                style: semiBoldText12.copyWith(
                                                    color: blackColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
