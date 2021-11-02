import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ladder/app/data/models/user_model.dart';

import 'package:ladder/app/routes/app_pages.dart';
import 'package:ladder/app/utils/theme.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthController extends GetxController {
  var isSkipIntro = false.obs;
  var isAuth = false.obs;

  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;
  UserCredential? userCredential;

  var user = UserModel().obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // BAGIAN LOGIN GOOGLE
  Future<void> firstInitialized() async {
    await autoLogin().then((value) {
      if (value) {
        isAuth.value = true;
      }
    });

    await skipIntro().then((value) {
      if (value) {
        isSkipIntro.value = true;
      }
    });
  }

  Future<bool> skipIntro() async {
    //KITA AKAN MENGUBAH isSkipIntro MENJADI TRUE
    final box = GetStorage();
    if (box.read('skipIntro') != null || box.read('skipIntro') == true) {
      return true;
    }
    return false;
  }

  Future<bool> autoLogin() async {
    //KITA AKAN MENGUBAH isAuth MENJADI TRUE
    try {
      final isSignIn = await _googleSignIn.isSignedIn();
      if (isSignIn) {
        await _googleSignIn
            .signInSilently()
            .then((value) => _currentUser = value);
        final googleAuth = await _currentUser!.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);

        print('User Credential');
        print(userCredential);

        // MASUKKAN DATA DI FIREBASE
        CollectionReference users = firestore.collection('users');

        users.doc(_currentUser!.email).update({
          "lastSignInTime":
              userCredential!.user!.metadata.lastSignInTime!.toIso8601String(),
        });

        final currUser = await users.doc(_currentUser!.email).get();
        final currUserData = currUser.data() as Map<String, dynamic>;

        user(UserModel(
          uid: currUserData["uid"],
          name: currUserData["name"],
          phoneNumber: currUserData["phoneNumber"],
          email: currUserData["email"],
          photoUrl: currUserData["photoUrl"],
          creationTime: currUserData["creationTime"],
          lastSignInTime: currUserData["lastSignInTime"],
          updateTime: currUserData["updateTime"],
        ));

        return true;
      }
      return false;
    } catch (err) {
      return false;
    }
  }

  Future<void> login() async {
    // BUAT FUNGSI UNTUK LOGIN DENGAN GOOGLE
    try {
      //HANDLE KEBOCORAN DATA USER SEBELUM LOGIN
      await _googleSignIn.signOut();

      //UNTUK MENAMPILKAN POP OUT GOOGLE
      await _googleSignIn.signIn().then((value) => _currentUser = value);

      // UNTUK MENGECEK STATUS LOGIN USER
      final isSignIn = await _googleSignIn.isSignedIn();

      if (isSignIn) {
        // KONDISI LOGIN BERHASIL
        print('SUDAH BERHASIL LOGIN DENGAN AKUN : ');
        print(_currentUser);

        final googleAuth = await _currentUser!.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);

        print('User Credential');
        print(userCredential);

        //SIMPAN STATUS USER BAHWA SUDAH PERNAH LOGIN
        final box = GetStorage();
        if (box.read('skipIntro') != null) {
          box.remove('skipIntro');
        }
        box.write('skipIntro', true);

        // MASUKKAN DATA DI FIREBASE
        CollectionReference users = firestore.collection('users');

        final checkUser = await users.doc(_currentUser!.email).get();

        if (checkUser.data() == null) {
          users.doc(_currentUser!.email).set({
            "uid": userCredential!.user!.uid,
            "name": _currentUser!.displayName,
            "phoneNumber": userCredential!.user!.phoneNumber ?? "",
            "email": _currentUser!.email,

            // "photoUrl": _currentUser!.photoUrl ?? "noimage",
            "photoUrl": _currentUser!.photoUrl,
            "createdAt":
                userCredential!.user!.metadata.creationTime!.toIso8601String(),
            "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
            "updateTime": DateTime.now().toIso8601String(),
          });
        } else {
          users.doc(_currentUser!.email).update({
            "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
          });
        }

        final currUser = await users.doc(_currentUser!.email).get();
        final currUserData = currUser.data() as Map<String, dynamic>;

        user(
          UserModel(
            uid: currUserData["uid"],
            name: currUserData["name"],
            phoneNumber: currUserData["phoneNumber"],
            email: currUserData["email"],
            photoUrl: currUserData["photoUrl"],
            creationTime: currUserData["creationTime"],
            lastSignInTime: currUserData["lastSignInTime"],
            updateTime: currUserData["updateTime"],
          ),
        );

        isAuth.value = true;
        Get.offAllNamed(Routes.BOTTOM_NAV_BAR);
      } else {
        // KONDISI LOGIN GAGAL
        print('TIDAK BERHASIL LOGIN  : ');
        Get.defaultDialog(
            title: 'Terjadi Kesalahan', middleText: 'Gagal Login');
      }
    } catch (error) {
      print(error);
    }
  }

  //UPDATE PROFILE
  void changeProfile(String name, String phoneNumber) {
    String date = DateTime.now().toIso8601String();
    CollectionReference users = firestore.collection("users");

    users.doc(_currentUser!.email).update({
      "name": name,
      "phoneNumber": phoneNumber,
      "lastSignInTime":
          userCredential!.user!.metadata.lastSignInTime!.toIso8601String(),
      "updateTime": date,
    });

    user.update((user) {
      user!.name = name;
      user.phoneNumber = phoneNumber;
      user.lastSignInTime =
          userCredential!.user!.metadata.lastSignInTime!.toIso8601String();
      user.updateTime = date;
    });

    Get.defaultDialog(
      title: 'Informasi',
      middleText: "Perubahan Berhasil",
    );

    user.refresh();
  }

  Future<void> logOut() async {
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();

    Get.defaultDialog(
      title: 'Informasi',
      middleText: 'Anda yakin ingin Keluar?',
      titleStyle: boldText16.copyWith(color: blackColor),
      contentPadding: EdgeInsets.only(bottom: 16),
      //Button Confirm
      confirm: Container(
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
              Get.toNamed(Routes.LOGIN);
            },
            child: Center(
              child: Text('Iya',
                  style: semiBoldText14.copyWith(color: whiteColor)),
            ),
          ),
        ),
      ),

      //BUtton Cancel
      cancel: Container(
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
              child: Text('Tidak',
                  style: semiBoldText14.copyWith(color: pinkColor)),
            ),
          ),
        ),
      ),
    );
  }
}
