import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import 'package:get/get.dart';
import 'package:ladder/app/controllers/auth_controller.dart';

import 'app/controllers/network_controller.dart';
import 'app/routes/app_pages.dart';

import 'app/utils/error_screen.dart';
// import 'app/utils/loading_screen.dart';
import 'app/utils/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);
  final NetworkController _networkController = Get.put(NetworkController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: authC.firstInitialized(),
      builder: (context, snapshot) {
        if (_networkController.connectionStatus.value == 0) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          return ErrorScreen();
        } else {
          if (snapshot.connectionState == ConnectionState.done) {
            // if (snapshot.connectionState == ConnectionState.done ||
            //     _networkController.connectionStatus.value == 1 ||
            //     _networkController.connectionStatus.value == 2) {
            // GetMaterialApp(
            //   debugShowCheckedModeBanner: false,
            //   title: "Ladder",
            //   initialRoute: Routes.SERVICE_DETAIL,
            //   getPages: AppPages.routes,
            // );
            return Obx(
              () => GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: "Ladder",
                initialRoute: authC.isSkipIntro.isTrue
                    ? authC.isAuth.isTrue
                        ? Routes.BOTTOM_NAV_BAR
                        : Routes.LOGIN
                    : Routes.INTRODUCTION_SCREEN,
                getPages: AppPages.routes,
              ),
            );
          }
        }

        return FutureBuilder(
          future: Future.delayed(Duration(seconds: 5)),
          builder: (context, snapshot) => SplashScreen(),
        );
      },
    );
  }
}
