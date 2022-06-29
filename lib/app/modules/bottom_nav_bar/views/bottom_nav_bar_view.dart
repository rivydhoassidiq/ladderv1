import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ladder/app/modules/home/views/home_view.dart';

import 'package:ladder/app/modules/profile/views/profile_view.dart';
import 'package:ladder/app/routes/app_pages.dart';
import 'package:ladder/app/utils/theme.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({Key? key}) : super(key: key);

  @override
  _BottomNavBarrState createState() => _BottomNavBarrState();
}

class _BottomNavBarrState extends State<BottomNavBarView> {
  int _selectedIndex = 0;

  final _screens = [
    HomeView(),
    ProfileView(),
  ];

  String? _tokenId;
  String _debugLabelString = "";
  String name = "";

  Future<void> initPlatformState() async {
    if (!mounted) return;

    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      print('FOREGROUND HANDLER CALLED WITH: ${event}');

      /// Display Notification, send null to not display
      event.complete(event.notification);

      this.setState(() {
        _debugLabelString =
            "Notification received in foreground notification: \n${event.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
    });
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) async {
        Get.toNamed(Routes.BOTTOM_NAV_BAR);
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => ChatView(
        //               arguments: shopId,
        //             )));
      },
    );
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      setState(() {
        name = result.notification.additionalData!['email'];
      });
      print('NOTIFICATION OPENED HANDLER CALLED WITH: ${result}');
      print('${result.notification.additionalData!['email']}');
      // print(shopId);
      // navigatorKey.currentState.pushNamed('/request');

      print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
    });
  }

  final user = FirebaseAuth.instance.currentUser;
  void inputData() async {
    var status = await OneSignal.shared.getDeviceState();
    setState(() {
      _tokenId = status!.userId;
    });
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email) // <-- Document ID
        .update({
      "token": _tokenId,
    }).catchError((error) => print('Add failed: $error'));

    // final shopDoc = await FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(FirebaseAuth.instance.currentUser!.email)
    //     .get();

    // FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(FirebaseAuth.instance.currentUser!.email)
    //     .get()
    //     .then((DocumentSnapshot documentSnapshot) {
    //   if (shopDoc.data()!.containsValue("hasShop")) {
    //     setState(() {
    //       shopId = shopDoc['shopId'];
    //     });

    //     FirebaseFirestore.instance
    //         .collection('shop')
    //         .doc(shopDoc['shopId'])
    //         .update({
    //       "token": _tokenId,
    //     }).catchError((error) => print('Add failed: $error'));
    //   }
    //   // here you write the codes to input the data into firestore
    // });
  }

  @override
  void initState() {
    super.initState();
    inputData();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // appBar: AppBar(
        backgroundColor: whiteColor,

        // ),
        bottomNavigationBar: Material(
          child: Container(
            color: whiteColor,
            height: 66,
            child: TabBar(
              indicatorColor: bottomBlueColor,
              indicatorWeight: 2,
              indicatorPadding:
                  const EdgeInsets.only(right: 29, top: 0, bottom: 0, left: 29),
              indicator: BoxDecoration(
                border: Border(
                  top: BorderSide(color: bottomBlueColor, width: 3),
                ),
              ),
              labelStyle: boldText8,
              labelColor: bottomBlueColor,
              unselectedLabelColor: sliderColor,
              onTap: (i) {
                setState(() {
                  _selectedIndex = i;
                });
              },
              tabs: [
                Tab(
                  icon: Image.asset(
                    'assets/icons/home.png',
                    height: 24,
                    width: 24,
                    color: _selectedIndex == 0 ? bottomBlueColor : sliderColor,
                    // color: bottomBlueColor,
                  ),
                  text: "Home",
                ),
                Tab(
                  icon: Image.asset(
                    'assets/icons/profilepict.png',
                    height: 24,
                    width: 24,
                    color: _selectedIndex == 1 ? bottomBlueColor : sliderColor,
                  ),
                  text: "Profile",
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: _screens
                .asMap()
                .map((i, screen) => MapEntry(
                    i,
                    Offstage(
                      offstage: _selectedIndex != i,
                      child: screen,
                    )))
                .values
                .toList(),
          ),
        ),
      ),
    );
  }
}
