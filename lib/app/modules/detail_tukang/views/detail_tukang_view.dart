import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/src/iterable_extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:ladder/app/controllers/auth_controller.dart';

import 'package:ladder/app/data/models/users_model.dart';
import 'package:ladder/app/routes/app_pages.dart';
import 'package:ladder/app/utils/loading_screen.dart';

import 'package:ladder/app/utils/theme.dart';

import '../controllers/detail_tukang_controller.dart';

class DetailTukangView extends StatefulWidget {
  const DetailTukangView({Key? key}) : super(key: key);

  @override
  State<DetailTukangView> createState() => _DetailTukangViewState();
}

class _DetailTukangViewState extends State<DetailTukangView> {
  DetailTukangController controller = Get.put(DetailTukangController());

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Flexible(
                  //   flex: 1,
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(4),
                  //         color: whiteColor,
                  //         border: Border.all(
                  //           color: pinkColor,
                  //         )),
                  //     child: Material(
                  //       color: Colors.transparent,
                  //       child: InkWell(
                  //         borderRadius: BorderRadius.circular(4),
                  //         onTap: () => Get.toNamed(Routes.GIFT_RATINIG,
                  //             arguments: listAllDocs.email),
                  //         child: Center(
                  //           child: Text(
                  //             'Beri ulasan',
                  //             style: semiBoldText14.copyWith(color: pinkColor),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(width: 8),
                  Flexible(
                    flex: 1,
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
                  ),
                ],
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
            var umur = listAllDocs.umur;
            var photoUrl = listAllDocs.photoUrl;
            var keahlian = listAllDocs.keahlian;

            return Container(
              width: sizeWidth,
              padding: EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // '${(listAllDocs as Map<String, dynamic>)["name"]}',
                                      name!,
                                      style: semiBoldText14.copyWith(
                                          color: blackColor),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      umur! + " " + "Tahun",
                                      style: regularText12,
                                    ),
                                    SizedBox(height: 4),
                                    // StreamBuilder(
                                    //   stream: FirebaseFirestore.instance
                                    //       .collection('users')
                                    //       .doc(Get.arguments)
                                    //       .collection('rating')
                                    //       .snapshots(),
                                    //   builder: (BuildContext context,
                                    //       AsyncSnapshot snapshot) {
                                    //     if (snapshot.connectionState ==
                                    //         ConnectionState.waiting) {
                                    //       return Center(
                                    //           child: CircularProgressIndicator(
                                    //         strokeWidth: 2,
                                    //         color: whiteColor,
                                    //       ));
                                    //     }
                                    //     List<double> ratings = [];

                                    //     snapshot.data.docs.forEach((element) {
                                    //       final map2 = element.data();
                                    //       ratings.add(map2['rating']);
                                    //     });
                                    //     double rating1 = (ratings.sum) /
                                    //         snapshot.data.docs.length;
                                    //     return snapshot.data.docs.length == 0
                                    //         ? Row(
                                    //             mainAxisAlignment:
                                    //                 MainAxisAlignment.start,
                                    //             crossAxisAlignment:
                                    //                 CrossAxisAlignment.start,
                                    //             children: [
                                    //               Icon(Icons.star_rate_rounded,
                                    //                   size: 15,
                                    //                   color: Color(0xFFFFC107)),
                                    //               Text(
                                    //                 'Belum ada penilaian',
                                    //                 style:
                                    //                     regularText12.copyWith(
                                    //                   color: sliderColor,
                                    //                 ),
                                    //               )
                                    //             ],
                                    //           )
                                    //         : Row(
                                    //             mainAxisAlignment:
                                    //                 MainAxisAlignment.start,
                                    //             crossAxisAlignment:
                                    //                 CrossAxisAlignment.start,
                                    //             children: [
                                    //               Icon(Icons.star_rate_rounded,
                                    //                   size: 15,
                                    //                   color: Color(0xFFFFC107)),
                                    //               Text(
                                    //                 double.parse("$rating1")
                                    //                     .toStringAsFixed(1),
                                    //                 style:
                                    //                     regularText12.copyWith(
                                    //                   color:
                                    //                       Colors.grey.shade600,
                                    //                 ),
                                    //               )
                                    //             ],
                                    //           );
                                    //   },
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Pekerjaan yang dikuasai',
                                    style:
                                        boldText14.copyWith(color: blackColor)),
                                SizedBox(height: 16),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: keahlian!
                                        .map(
                                          (kh) => Container(
                                            margin: EdgeInsets.only(right: 16),
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

                                              borderRadius: BorderRadius.all(
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
                                                    style:
                                                        semiBoldText12.copyWith(
                                                      color: Color(0xFF6F97B5),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                SizedBox(height: 4),
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Text('Ulasan Pengguna', style: boldText14),
                                //     TextButton(
                                //       onPressed: () => Get.toNamed(
                                //           Routes.DETAIL_RATING,
                                //           arguments: listAllDocs.email),
                                //       child: Text('Lihat Semua',
                                //           style: semiBoldText14.copyWith(
                                //               color: blueColorColor)),
                                //     ),
                                //   ],
                                // ),
                                // SizedBox(height: 4),
                                // SizedBox(
                                //   height: 400,
                                //   child: StreamBuilder(
                                //     stream: FirebaseFirestore.instance
                                //         .collection('users')
                                //         .doc(Get.arguments)
                                //         .collection('rating')
                                //         .orderBy("time", descending: true)
                                //         .snapshots(),
                                //     builder: (BuildContext context,
                                //         AsyncSnapshot snapshot) {
                                //       if (snapshot.connectionState ==
                                //           ConnectionState.waiting) {
                                //         return Center(
                                //           child: LoadingScreen(),
                                //         );
                                //       }
                                //       var listAll = snapshot.data!.docs;

                                //       List<String> komen = [];

                                //       snapshot.data.docs.forEach((element) {
                                //         final map3 = element.data();
                                //         komen.add(map3['komen']);
                                //       });

                                //       return listAll.length == 0
                                //           ? Center(
                                //               child: Column(
                                //                 // mainAxisAlignment:
                                //                 //     MainAxisAlignment.center,
                                //                 // crossAxisAlignment:
                                //                 //     CrossAxisAlignment.center,
                                //                 children: [
                                //                   Container(
                                //                     padding:
                                //                         EdgeInsets.only(top: 8),
                                //                     child: const Image(
                                //                       image: AssetImage(
                                //                           'assets/images/kosong.png'),
                                //                       width: 230,
                                //                       height: 230,
                                //                     ),
                                //                   ),
                                //                   const SizedBox(height: 16),
                                //                   Text('Belum Ada Ulasan',
                                //                       style: semiBoldText14
                                //                           .copyWith(
                                //                               color:
                                //                                   blackColor)),
                                //                 ],
                                //               ),
                                //             )
                                //           : ListView.builder(
                                //               itemCount: 2,
                                //               itemBuilder: (context, index) {
                                //                 return Column(
                                //                   children: [
                                //                     Container(
                                //                       padding: const EdgeInsets
                                //                               .symmetric(
                                //                           horizontal: 16,
                                //                           vertical: 16),
                                //                       width: double.infinity,
                                //                       decoration: BoxDecoration(
                                //                           color: Colors.white,
                                //                           borderRadius:
                                //                               BorderRadius
                                //                                   .circular(8),
                                //                           boxShadow: [
                                //                             BoxShadow(
                                //                               color:
                                //                                   sliderColor,
                                //                               spreadRadius: 0,
                                //                               blurRadius: 1,
                                //                               offset:
                                //                                   Offset(1, 2),
                                //                             ),
                                //                           ]),
                                //                       child: Column(
                                //                         mainAxisAlignment:
                                //                             MainAxisAlignment
                                //                                 .start,
                                //                         crossAxisAlignment:
                                //                             CrossAxisAlignment
                                //                                 .start,
                                //                         children: [
                                //                           Row(
                                //                             children: [
                                //                               Container(
                                //                                 width:
                                //                                     Get.width *
                                //                                         0.10,
                                //                                 height:
                                //                                     Get.width *
                                //                                         0.10,
                                //                                 child:
                                //                                     CircleAvatar(
                                //                                   backgroundColor:
                                //                                       whiteColor,
                                //                                   backgroundImage:
                                //                                       NetworkImage(
                                //                                           listAll[index]
                                //                                               [
                                //                                               "photoUrl"]),
                                //                                 ),
                                //                               ),
                                //                               SizedBox(
                                //                                   width: 12),
                                //                               Column(
                                //                                 mainAxisAlignment:
                                //                                     MainAxisAlignment
                                //                                         .start,
                                //                                 crossAxisAlignment:
                                //                                     CrossAxisAlignment
                                //                                         .start,
                                //                                 children: [
                                //                                   Text(
                                //                                     listAll[index]
                                //                                         [
                                //                                         "name"],
                                //                                     style:
                                //                                         semiBoldText14,
                                //                                   ),
                                //                                   SizedBox(
                                //                                       height:
                                //                                           4),
                                //                                   RatingBarIndicator(
                                //                                     unratedColor:
                                //                                         sliderColor,
                                //                                     itemSize:
                                //                                         12,
                                //                                     itemPadding:
                                //                                         EdgeInsets.only(
                                //                                             right:
                                //                                                 4),
                                //                                     rating: listAll[
                                //                                             index]
                                //                                         [
                                //                                         "rating"],
                                //                                     itemBuilder:
                                //                                         (context,
                                //                                                 _) =>
                                //                                             Icon(
                                //                                       Icons
                                //                                           .star,
                                //                                       color: Color(
                                //                                           0xFFFFC107),
                                //                                     ),
                                //                                   )
                                //                                 ],
                                //                               ),
                                //                             ],
                                //                           ),
                                //                           SizedBox(height: 8),
                                //                           Text(
                                //                               listAll[index]
                                //                                   ["komen"],
                                //                               style: regularText12
                                //                                   .copyWith(
                                //                                       color:
                                //                                           blackColor)),
                                //                         ],
                                //                       ),
                                //                     ),
                                //                     SizedBox(height: 16)
                                //                   ],
                                //                 );
                                //               },
                                //             );
                                //     },
                                //   ),
                                // ),
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
        },
      ),
    );
  }
}
