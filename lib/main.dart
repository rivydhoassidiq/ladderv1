import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ladder/app/controllers/auth_controller.dart';

import 'app/routes/app_pages.dart';
import 'app/utils/error_screen.dart';
import 'app/utils/loading_screen.dart';
import 'app/utils/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return ErrorScreen();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          // return GetMaterialApp(
          //   debugShowCheckedModeBanner: false,
          //   title: "Ladder",
          //   initialRoute: Routes.CHANGE_PROFILE,
          //   getPages: AppPages.routes,
          // );
          return FutureBuilder(
            future: Future.delayed(
              Duration(seconds: 3),
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Obx(() => GetMaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: "Ladder",
                      initialRoute: authC.isSKipIntro.isTrue
                          ? authC.isAuth.isTrue
                              ? Routes.BOTTOM_NAV_BAR
                              : Routes.LOGIN
                          : Routes.INTRODUCTION_SCREEN,
                      getPages: AppPages.routes,
                    ));
              }
              return SplashScreen();
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return LoadingScreen();
      },
    );
  }
}
