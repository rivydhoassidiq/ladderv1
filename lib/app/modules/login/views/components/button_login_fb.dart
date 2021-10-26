// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:get/get.dart';
// import 'package:ladder/app/controllers/auth_controller.dart';
// import 'package:ladder/app/routes/app_pages.dart';

// import 'package:ladder/app/utils/theme.dart';

// class RoundedButtonLGFB extends StatefulWidget {
//   RoundedButtonLGFB({
//     Key? key,
//     required this.title,
//     required this.image,
//   }) : super(key: key);

//   final String title;
//   final String image;

//   @override
//   State<RoundedButtonLGFB> createState() => _RoundedButtonLGFBState();
// }

// class _RoundedButtonLGFBState extends State<RoundedButtonLGFB> {
//   var loading = false;
//   void loginWithFacebook() async {
//     setState(() {
//       loading = true;
//     });
//     try {
//       final LoginResult facebookLoginResult =
//           await FacebookAuth.instance.login();
//       final userData = await FacebookAuth.instance.getUserData();

//       final OAuthCredential FacebookAuthCredential =
//           FacebookAuthProvider.credential(
//               facebookLoginResult.accessToken!.token);
//       await FirebaseAuth.instance.signInWithCredential(FacebookAuthCredential);

//       await FirebaseFirestore.instance.collection('userfb').add({
//         'email': userData['email'],
//         'imageUrl': userData['picture']['data']['url'],
//         'name': userData['name'],
//       });

//       Get.offAllNamed(Routes.BOTTOM_NAV_BAR);
//     } on FirebaseAuthException catch (e) {
//       var content = '';
//       switch (e.code) {
//         case 'account-exist-with-different-credential':
//           content = 'This account exist with a different sign in provide';
//           break;
//         case 'invalid-credential':
//           content = 'Unknown error has occured';
//           break;
//         case 'operation-not-allowed':
//           content = 'This operation is not allowed';
//           break;
//         case 'user-not-found':
//           content = 'The user you tried to log into was not found';
//           break;
//       }

//       Get.defaultDialog(
//         title: 'Login With Facebook Failed',
//         content: Text(content),
//         actions: [
//           TextButton(
//             onPressed: () => Get.back(),
//             child: Text('Ok'),
//           ),
//         ],
//       );
//     } finally {
//       setState(() {
//         loading = false;
//       });
//     }
//   }

//   final authC = Get.find<AuthController>();

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return InkWell(
//       onTap: () => loginWithFacebook(),
//       borderRadius: BorderRadius.circular(30),
//       child: Container(
//         width: size.width * 0.8,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           color: fbColor,
//         ),
//         padding: EdgeInsets.symmetric(vertical: 20),
//         alignment: Alignment.center,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               widget.image,
//               width: 32,
//               height: 22,
//             ),
//             const SizedBox(width: 5),
//             Text(
//               widget.title,
//               style: boldText16.copyWith(
//                 color: whiteColor,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
