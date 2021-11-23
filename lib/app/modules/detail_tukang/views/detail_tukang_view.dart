import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ladder/app/controllers/auth_controller.dart';

import 'package:ladder/app/data/models/users_model.dart';
import 'package:ladder/app/utils/loading_screen.dart';

import 'package:ladder/app/utils/theme.dart';

import '../controllers/detail_tukang_controller.dart';

class DetailTukangView extends GetView<DetailTukangController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;

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
      bottomNavigationBar: FutureBuilder<DocumentSnapshot<UsersModel?>>(
        future: controller.getDataaa(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var listAllDocs = snapshot.data!.data()!;
            var email = listAllDocs.email;
            return Container(
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
                    onTap: () => authC.addNewConnection(email!),
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
            );
          }
          return Center(
            child: LoadingScreen(),
          );
        },
      ),
      body: FutureBuilder<DocumentSnapshot<UsersModel?>>(
          future: controller.getDataaa(Get.arguments),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var listAllDocs = snapshot.data!.data()!;

              var name = listAllDocs.name;
              var photoUrl = listAllDocs.photoUrl;
              var keahlian = listAllDocs.keahlian;

              return Container(
                width: sizeWidth,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                      backgroundColor: sliderColor,
                                      backgroundImage: NetworkImage(
                                        // 'https://1409791524.rsc.cdn77.org/data/images/full/567629/blackpink-jisoo-all-black-hip-style-lovely-is-a-bonus.jpg',
                                        photoUrl!.toString(),
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
                                        name!,
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Pekerjaan yang dikuasai',
                                      style: boldText14.copyWith(
                                          color: blackColor)),
                                  SizedBox(height: 16),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: keahlian!
                                          .map((kh) => Container(
                                                margin:
                                                    EdgeInsets.only(right: 16),
                                                // height: Get.width * 0.3,
                                                // width: Get.width * 0.3,
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 29,
                                                  vertical: 12,
                                                ),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Color(0xFF6F97B5),
                                                  ),
                                                  // color: blueColorColor,

                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(8),
                                                  ),
                                                ),
                                                // color: Colors.black,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    // Image.asset(
                                                    //   'assets/icons/icon_tukang.png',
                                                    //   width: 20,
                                                    //   height: 20,
                                                    // ),
                                                    // SizedBox(height: 8),
                                                    Center(
                                                      child: Text(
                                                        kh,
                                                        style: semiBoldText12
                                                            .copyWith(
                                                                color: Color(
                                                                    0xFF6F97B5)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ))
                                          .toList(),
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
            return Center(child: LoadingScreen());
          }),
    );
  }
}
