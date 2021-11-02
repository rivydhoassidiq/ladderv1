import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ladder/app/data/models/reapiring.dart';
import 'package:ladder/app/modules/home/controllers/home_controller.dart';
import 'package:ladder/app/modules/home/views/components/single_product.dart';

import 'package:ladder/app/utils/theme.dart';

class CleaningPage extends StatelessWidget {
  const CleaningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;
    HomeController producsController = Get.put(HomeController());

    final widthC = sizeWidth;
    final heightC = sizeHeight;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
        title: Text(
          'Cleaning',
          style: boldText16.copyWith(color: blackColor),
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => GridView.count(
            crossAxisCount: 2,
            // childAspectRatio: .63,
            padding: const EdgeInsets.all(10),
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16,
            children: producsController.cleaning_products
                .map((RepairingModel product) {
              return SingleProductWidget(
                product: product,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
