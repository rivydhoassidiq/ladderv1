import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ladder/app/data/models/reapiring.dart';
import 'package:ladder/app/modules/home/controllers/home_controller.dart';
import 'package:ladder/app/modules/home/views/components/single_product.dart';
import 'package:ladder/app/utils/theme.dart';

class RepairingPage extends StatelessWidget {
  const RepairingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController producsController = Get.put(HomeController());

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
          'Repairing',
          style: boldText16.copyWith(color: blackColor),
        ),
      ),
      body: SafeArea(
        child: Obx(() => GridView.count(
            crossAxisCount: 2,
            // childAspectRatio: .63,
            padding: const EdgeInsets.all(10),
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16,
            children: producsController.repairing_products
                .map((RepairingModel product) {
              return SingleProductWidget(
                product: product,
              );
            }).toList())),
      ),
    );
  }
}
