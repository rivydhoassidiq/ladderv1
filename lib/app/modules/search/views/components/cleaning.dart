import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ladder/app/data/models/reapiring.dart';

import 'package:ladder/app/routes/app_pages.dart';
import 'package:ladder/app/utils/theme.dart';

class CleaningCard extends StatelessWidget {
  final RepairingModel product;
  const CleaningCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.PILIH_TUKANG, arguments: product.name),
      child: Container(
        margin: EdgeInsets.only(right: 12, bottom: 5),
        // padding: EdgeInsets.only(vertical: 50),

        // height: 120,
        width: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: sliderColor,
                spreadRadius: 0,
                blurRadius: 1,
                offset: Offset(1, 2),
              ),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              child: Image.network(
                product.image.toString(),
                width: 140,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                  child: Text(
                    product.name.toString(),
                    style: semiBoldText14.copyWith(color: blackColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
