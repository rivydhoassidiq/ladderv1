import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/src/iterable_extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ladder/app/controllers/auth_controller.dart';

import 'package:ladder/app/data/models/users_model.dart';
import 'package:ladder/app/routes/app_pages.dart';
import 'package:ladder/app/utils/loading_screen.dart';
import 'package:ladder/app/utils/theme.dart';

import '../controllers/pilih_tukang_controller.dart';

class PilihTukangView extends StatefulWidget {
  const PilihTukangView({Key? key}) : super(key: key);

  @override
  _PilihTukangViewState createState() => _PilihTukangViewState();
}

class _PilihTukangViewState extends State<PilihTukangView> {
  final authC = Get.find<AuthController>();
  PilihTukangController controller = Get.put(PilihTukangController());
  bool isLoading = true;
  final user = FirebaseAuth.instance.currentUser;

  late double angka = 0.01;

  // @override
  // void initState() {
  //   super.initState();

  //   loadData();
  // }

  // Future loadData() async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   await Future.delayed(Duration(seconds: 2), () {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   });
  // }

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
          'Pilih Tukang',
          style: boldText16.copyWith(color: blackColor),
        ),
      ),
      body:
          //  isLoading
          //     ? Center(
          //         child: LoadingScreen(),
          //       )
          //     :
          StreamBuilder<QuerySnapshot<UsersModel?>>(
        stream: controller.streamTukangg(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingScreen(),
            );
          }
          var listAllDocs = snapshot.data!.docs;
          print(listAllDocs.length);
          return listAllDocs.length == 0
              ? Center(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/coming_soon.png',
                        height: 131,
                        width: 140,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Akan Segera Hadir',
                        style: boldText14.copyWith(color: blackColor),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Servis ini akan segera hadir di aplikasi Ladder',
                        style: regularText12,
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: listAllDocs.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => Get.toNamed(Routes.DETAIL_TUKANG,
                        arguments: listAllDocs[index].data()!.email),
                    child: Container(
                      margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(.5),
                              offset: Offset(3, 2),
                              blurRadius: 7)
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(
                              // '${(listAllDocs[index].data() as Map<String, dynamic>)["photoUrl"]}',
                              '${listAllDocs[index].data()!.photoUrl}',
                              // authC.userr.value.photoUrl!,
                            ),
                          ),
                          SizedBox(width: 16),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // '${(listAllDocs[index].data() as Map<String, dynamic>)["name"]}',
                                '${listAllDocs[index].data()!.name}',
                                // '${authC.userr.value.name!}',
                                style:
                                    semiBoldText14.copyWith(color: blackColor),
                              ),
                              StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(listAllDocs[index].data()!.email)
                                      .collection('rating')
                                      .snapshots(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                          child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: whiteColor,
                                      ));
                                    }
                                    var listAll = snapshot.data!.docs;

                                    List<double> ratings = [];

                                    snapshot.data.docs.forEach((element) {
                                      final map2 = element.data();
                                      ratings.add(map2['rating']);
                                    });
                                    double rating1 = (ratings.sum) /
                                        snapshot.data.docs.length;

                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.star_rate_rounded,
                                          size: 15,
                                          color: Color(0xFFFFC107),
                                        ),
                                        SizedBox(width: 4),
                                        //     // listAllDocs[index].data()!.rating ==
                                        //     //         angka
                                        //     //     // listAllDocs.join('rating').isEmpty
                                        //     //     ?
                                        //     //     Text('Belum ada penilaian',
                                        //     //         style: regularText12.copyWith(
                                        //     //             color: sliderColor))
                                        //     // :
                                        Text(
                                          double.parse("$rating1")
                                              .toStringAsFixed(1),
                                          style: regularText12.copyWith(
                                            color: Colors.grey.shade600,
                                          ),
                                        )
                                        //     //  Text(
                                        //     //     '${listAllDocs[index].data()!.rating}',
                                        //     //     style: regularText12.copyWith(
                                        //     //       color: Colors.grey.shade600,
                                        //     //     ),
                                        //     //   ),
                                      ],
                                    );
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
