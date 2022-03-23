import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/src/iterable_extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:ladder/app/controllers/auth_controller.dart';
import 'package:ladder/app/utils/theme.dart';
import 'package:lottie/lottie.dart';

import '../controllers/gift_ratinig_controller.dart';

class GiftRatinigView extends StatefulWidget {
  const GiftRatinigView({Key? key}) : super(key: key);

  @override
  State<GiftRatinigView> createState() => _GiftRatinigViewState();
}

class _GiftRatinigViewState extends State<GiftRatinigView> {
  final user = FirebaseAuth.instance.currentUser;
  final komenC = TextEditingController();

  final authC = Get.find<AuthController>();

  late double _rating;

  void rate(rate1) {
    _rating = rate1;
  }

  void _submit() async {
    // final user = await FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(Get.arguments)
        .collection('rating')
        .doc(user!.email)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
        FirebaseFirestore.instance
            .collection('users')
            .doc(Get.arguments)
            .collection('rating')
            .doc(user!.email)
            .update({
          'rating': _rating,
          'name': user!.displayName,
          'photoUrl': user!.photoURL,
          'komen': komenC.text,
          'time': DateTime.now().toIso8601String(),
        });
        try {
          dynamic nested = documentSnapshot.get(FieldPath(['uid']));
        } on StateError catch (e) {
          print(e);
        }
      } else {
        FirebaseFirestore.instance
            .collection('users')
            .doc(Get.arguments)
            .collection('rating')
            .doc(user!.email)
            .set({
          'rating': _rating,
          'email': user!.email,
          'name': user!.displayName,
          'photoUrl': user!.photoURL,
          "komen": komenC.text,
          'time': DateTime.now().toIso8601String(),
        });
      }
    });
  }

  void _submit2() async {
    final userr = await FirebaseFirestore.instance
        .collection('users')
        .doc(Get.arguments)
        .collection('rating')
        .get();
    List<double> ratings = [];

    userr.docs.forEach((element) {
      final map2 = element.data();
      ratings.add(map2['rating']);
    });
    double ratings1 = (ratings.sum) / userr.docs.length;

    FirebaseFirestore.instance
        .collection('users')
        .doc(Get.arguments)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
        FirebaseFirestore.instance
            .collection('users')
            .doc(Get.arguments)
            .update({
          'rating': ratings1,
        });
        try {
          dynamic nested = documentSnapshot.get(FieldPath(['uid']));
        } on StateError catch (e) {
          print(e);
        }
      }
      // else {
      //   FirebaseFirestore.instance.collection('users').doc(Get.arguments).set({
      //     'rating': ratings1,
      //   });
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
        elevation: 0,
        backgroundColor: whiteColor,
        title: Text(
          'Gift Rating',
          style: boldText16.copyWith(color: blackColor),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          // top: 8,
          left: 16,
          right: 16,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: Get.width * 0.7,
                height: Get.width * 0.7,
                child: LottieBuilder.asset('assets/lottie/rating.json'),
              ),
              // SizedBox(height: 8),
              Text('Berikan Rating',
                  style: boldText16.copyWith(color: blackColor)),
              SizedBox(height: 8),
              Text(
                "Sampaikan pendapat anda",
                style: semiBoldText12,
              ),
              SizedBox(height: 8),
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                itemSize: 30,
                itemPadding: EdgeInsets.only(right: 5),
                itemCount: 5,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Color(0xFFFFC107),
                ),
                onRatingUpdate: (rating) {
                  rate(rating);
                },
              ),
              SizedBox(height: 16),
              TextField(
                controller: komenC,
                maxLines: null,
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Masukkan Komentar",
                  hintStyle: regularText12,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 89,
                    height: 33,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: whiteColor,
                        border: Border.all(
                          color: pinkColor,
                        )),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(4),
                        onTap: () {
                          Get.back();
                        },
                        child: Center(
                          child: Text(
                            'Cancel',
                            style: semiBoldText14.copyWith(color: pinkColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 89,
                    height: 33,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: blueColorColor,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(4),
                        onTap: () {
                          Get.defaultDialog(
                              title: "",
                              middleText:
                                  "Terima Kasih Telah Memberikan Review",
                              middleTextStyle:
                                  regularText14.copyWith(color: blackColor),
                              actions: [
                                Column(
                                  children: [
                                    // Text('Terima Kasih Telah Memberikan Review'),
                                    RaisedButton(
                                      onPressed: () {
                                        _submit();
                                        Get.back();
                                        Get.back();
                                        _submit2();
                                      },
                                      child: Text('Ok'),
                                    ),
                                  ],
                                ),
                              ]);
                        },
                        child: Center(
                          child: Text(
                            'Ok',
                            style: semiBoldText14.copyWith(color: whiteColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _done() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              Column(
                children: [
                  Text('Terima Kasih Telah Memberikan Review'),
                  RaisedButton(
                    onPressed: () {
                      Get.back();
                      _submit2();
                      Get.back();
                    },
                    child: Text('Ok'),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
