import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ladder/app/routes/app_pages.dart';
import 'package:ladder/app/utils/theme.dart';

class RoundedButtonFB extends StatelessWidget {
  const RoundedButtonFB({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () => Get.offAllNamed(Routes.BOTTOM_NAV_BAR),
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: fbColor,
        ),
        padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 40,
              height: 30,
            ),
            const SizedBox(width: 5),
            Text(
              title,
              style: boldText16.copyWith(
                color: whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
