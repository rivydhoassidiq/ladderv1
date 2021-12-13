import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ladder/app/utils/theme.dart';
import 'package:lottie/lottie.dart';

import 'components/button_login_google.dart';
import 'components/button_signin_google.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;
  bool isLoading = false;
  late Animation<double> containerSize;

  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 270));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // digunakan untuk determine keyboard terbuka atau tidak
    double viewInset = MediaQuery.of(context).viewInsets.bottom;

    double defaultLoginSize = size.height - (size.height / 8);
    double defaultRegisterSize = size.height - (size.height / 7);

    containerSize =
        Tween<double>(begin: size.height * 0.1, end: defaultRegisterSize)
            .animate(
      CurvedAnimation(parent: animationController, curve: Curves.linear),
    );

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            //Cancel Button
            AnimatedOpacity(
              opacity: isLogin ? 0.0 : 1.0,
              duration: Duration(milliseconds: 270),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: size.width,
                  height: size.height * 0.1,
                  alignment: Alignment.bottomCenter,
                  child: IconButton(
                    onPressed: isLogin
                        ? null
                        : () {
                            animationController.reverse();
                            setState(() {
                              isLogin = !isLogin;
                            });
                          },
                    icon: Icon(Icons.close),
                  ),
                ),
              ),
            ),

            //Login Form
            AnimatedOpacity(
              opacity: isLogin ? 1.0 : 0.0,
              duration: Duration(milliseconds: 270 * 4),
              child: Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Container(
                    width: size.width,
                    height: defaultLoginSize,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome Back',
                          style: boldText24,
                        ),
                        SizedBox(height: 40),
                        Container(
                          width: Get.width * 0.7,
                          height: Get.width * 0.7,
                          child: Lottie.asset('assets/lottie/login.json'),
                        ),
                        RoundedButtonLGGG(
                            image: 'assets/icons/google.png',
                            title: 'Masuk dengan Google'),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Register Container
            // AnimatedBuilder(
            //   animation: animationController,
            //   builder: (context, child) {
            //     if (viewInset == 0 && isLogin) {
            //       return buildRegisterContainer();
            //     } else if (!isLogin) {
            //       return buildRegisterContainer();
            //     }

            //     // mengembalikan container kosong saat disembunyikan dari widget
            //     return Container();
            //   },
            // ),

            // //Register Form
            // AnimatedOpacity(
            //   opacity: isLogin ? 0.0 : 1.0,
            //   duration: Duration(milliseconds: 270 * 5),
            //   child: Visibility(
            //     visible: !isLogin,
            //     child: Align(
            //       alignment: Alignment.center,
            //       child: SingleChildScrollView(
            //         child: Container(
            //           width: size.width,
            //           height: defaultLoginSize,
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             children: [
            //               Text(
            //                 'Welcome',
            //                 style: boldText24,
            //               ),
            //               SizedBox(height: 40),
            //               Container(
            //                 width: Get.width * 0.8,
            //                 height: Get.width * 0.8,
            //                 child: Lottie.asset('assets/lottie/register.json'),
            //               ),
            //               // RoundedButtonSGFB(
            //               //     image: 'assets/icons/facebook.png',
            //               //     title: 'Daftar dengan Facebook'),
            //               // SizedBox(height: 20),
            //               RoundedButtonSGGG(
            //                   image: 'assets/icons/google.png',
            //                   title: 'Signup with Google'),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // Widget buildRegisterContainer() {
  //   return Align(
  //     alignment: Alignment.bottomCenter,
  //     child: Container(
  //       width: double.infinity,
  //       height: containerSize.value,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(100),
  //           topRight: Radius.circular(100),
  //         ),
  //         color: sliderColor2,
  //       ),
  //       alignment: Alignment.center,
  //       child: GestureDetector(
  //         // onTap: isLogin
  //         //     ? null
  //         //     : () {
  //         onTap: () {
  //           setState(() {
  //             animationController.forward();
  //             isLogin = !isLogin;
  //           });
  //         },
  //         child: isLogin
  //             ? Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Text(
  //                     "Belum punya akun? ",
  //                     style: GoogleFonts.openSans(
  //                       fontSize: 18,
  //                       color: fbColor,
  //                     ),
  //                   ),
  //                   Text(
  //                     "Daftar",
  //                     style: GoogleFonts.openSans(
  //                       fontSize: 18,
  //                       color: fbColor,
  //                       decoration: TextDecoration.underline,
  //                     ),
  //                   ),
  //                 ],
  //               )
  //             : null,
  //       ),
  //     ),
  //   );
  // }
}
