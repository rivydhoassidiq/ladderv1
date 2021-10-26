import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ladder/app/controllers/auth_controller.dart';
import 'package:ladder/app/routes/app_pages.dart';
import 'package:ladder/app/utils/theme.dart';

import '../controllers/profile_controller.dart';
import 'components/bt_bantuan.dart';
import 'components/bt_keluar.dart';
import 'components/bt_kp.dart';
import 'components/bt_sk.dart';
import 'components/bt_tentang.dart';

class ProfileView extends GetView<ProfileController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    final widthC = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    final heightC = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(16, 48, 16, 0),
            width: double.infinity,
            // height: Get.width * 0.35,
            height: widthC * 0.4,
            // color: Colors.amber,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //   width: Get.width * 0.23,
                    //   height: Get.width * 0.23,
                    //   decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     image: DecorationImage(
                    //       fit: BoxFit.fill,
                    //       image: AssetImage('assets/images/profilepict.png'),
                    //     ),
                    //   ),
                    // ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        authC.user.value.photoUrl!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 16),
                    Container(
                      padding: EdgeInsets.only(top: 19),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() => Text("${authC.user.value.name!}",
                              style: boldText16.copyWith(color: blackColor))),
                          SizedBox(width: 4),
                          Obx(() => authC.user.value.phoneNumber! == ""
                              ? Text('Masukkan Nomor', style: regularText12)
                              : Text('${authC.user.value.phoneNumber!}',
                                  style: regularText12)),
                          SizedBox(width: 4),
                          Text("${authC.user.value.email!}",
                              style: regularText12),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 19),
                      child: InkWell(
                        onTap: () => Get.toNamed(Routes.CHANGE_PROFILE),
                        child: Image.asset(
                          'assets/icons/Change Profile.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ButtonBantuan(),
          ButtonKP(),
          ButtonSK(),
          ButtonTentang(),
          ButtonKeluar(),
        ],
      )),
    );
  }
}
