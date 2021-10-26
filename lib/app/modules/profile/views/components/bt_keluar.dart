import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ladder/app/controllers/auth_controller.dart';
import 'package:ladder/app/utils/theme.dart';

class ButtonKeluar extends StatelessWidget {
  final authC = Get.find<AuthController>();

  ButtonKeluar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => authC.logOut(),
      child: Card(
        child: ListTile(
          leading: Image.asset(
            'assets/icons/keluar.png',
            width: 24,
            height: 24,
            color: redColor,
          ),
          hoverColor: Colors.amber,
          title: Text(
            'Keluar',
            style: semiBoldText16.copyWith(
              color: redColor,
            ),
          ),
        ),
      ),
    );
  }
}
