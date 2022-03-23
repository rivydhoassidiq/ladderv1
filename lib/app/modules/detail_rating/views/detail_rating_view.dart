import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ladder/app/utils/theme.dart';

class DetailRatingView extends StatefulWidget {
  @override
  State<DetailRatingView> createState() => DetailRatingViewState();
}

class DetailRatingViewState extends State<DetailRatingView> {
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
          'Semua Ulasan',
          style: boldText16.copyWith(color: blackColor),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(Get.arguments)
              .collection('rating')
              .orderBy("time", descending: true)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
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
            double rating1 = (ratings.sum) / snapshot.data.docs.length;

            List<String> komen = [];

            return listAll.length == 0
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment:
                      //     CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 8),
                          child: const Image(
                            image: AssetImage('assets/images/kosong.png'),
                            width: 230,
                            height: 230,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text('Belum Ada Ulasan',
                            style: semiBoldText14.copyWith(color: blackColor)),
                      ],
                    ),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: Column(
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          double.parse("$rating1").toStringAsFixed(1),
                          style: semiBoldText36,
                        ),
                        SizedBox(height: 12),
                        RatingBarIndicator(
                          unratedColor: sliderColor,
                          itemSize: 20,
                          itemPadding: EdgeInsets.only(right: 4),
                          rating: rating1,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Color(0xFFFFC107),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Berdasarkan ' +
                              listAll.length.toString() +
                              ' Ulasan',
                          style: semiBoldText14.copyWith(
                            color: sliderColor,
                          ),
                        ),
                        SizedBox(height: 16),
                        Expanded(
                          child: ListView.builder(
                              itemCount: listAll.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 16),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 16),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: sliderColor,
                                          spreadRadius: 0,
                                          blurRadius: 1,
                                          offset: Offset(1, 2),
                                        ),
                                      ]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: Get.width * 0.10,
                                            height: Get.width * 0.10,
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  listAll[index]["photoUrl"]),
                                            ),
                                          ),
                                          SizedBox(width: 12),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                listAll[index]["name"],
                                                style: semiBoldText14,
                                              ),
                                              SizedBox(height: 4),
                                              RatingBarIndicator(
                                                unratedColor: sliderColor,
                                                itemSize: 12,
                                                itemPadding:
                                                    EdgeInsets.only(right: 4),
                                                rating: listAll[index]
                                                    ["rating"],
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Color(0xFFFFC107),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Text(listAll[index]["komen"],
                                          style: regularText12.copyWith(
                                              color: blackColor)),
                                      SizedBox(height: 16),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  );
          }),
    );
  }
}
