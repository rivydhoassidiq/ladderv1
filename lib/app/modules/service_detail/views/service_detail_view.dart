import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ladder/app/data/models/reapiring.dart';
// import 'package:ladder/app/modules/home/controllers/home_controller.dart';
import 'package:ladder/app/routes/app_pages.dart';
import 'package:ladder/app/utils/theme.dart';

import '../controllers/service_detail_controller.dart';

class ServiceDetailView extends GetView<ServiceDetailController> {
  // final HomeController producsController = Get.put(HomeController());
  final RepairingModel product;

  ServiceDetailView(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
        title: Text(
          product.name.toString(),
          style: boldText16.copyWith(color: blackColor),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        height: 76,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: sliderColor)),
        ),

        // color: Colors.green,
        child: Container(
          decoration: BoxDecoration(
            color: blueColorColor,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              onTap: () =>
                  Get.toNamed(Routes.PILIH_TUKANG, arguments: product.id),
              child: Center(
                child: Text(
                  'Pesan Sekarang',
                  style: boldText16.copyWith(color: whiteColor),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          // color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2 * 3,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    // color: Colors.amber,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Image.network(product.image.toString()),
                        ),
                        SizedBox(height: 24),
                        Text(
                          'Deskripsi',
                          style: boldText16.copyWith(color: blackColor),
                        ),
                        SizedBox(height: 4),
                        Text(
                          product.description.toString(),
                          style: regularText14,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerIcon extends StatelessWidget {
  const ContainerIcon({
    Key? key,
    required this.image,
  }) : super(key: key);

  final image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 39,
      height: 39,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: pinkColor,
      ),
      child: Material(
        color: Colors.transparent,
        child: Image.asset(
          image,
        ),
      ),
    );
  }
}
