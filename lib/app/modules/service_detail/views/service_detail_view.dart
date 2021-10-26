import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ladder/app/routes/app_pages.dart';
import 'package:ladder/app/utils/theme.dart';

import '../controllers/service_detail_controller.dart';

class ServiceDetailView extends GetView<ServiceDetailController> {
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
          'Cuci Ac',
          style: boldText16.copyWith(color: blackColor),
        ),
      ),
      body: SafeArea(
        child: Flexible(
          flex: 1,
          child: Container(
            // color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 2 * 3,
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
                          child: Image.asset('assets/images/lampu3.png'),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Lampu',
                          style: boldText16.copyWith(color: blackColor),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Color(0xFFFFC107),
                            ),
                            Icon(
                              Icons.star,
                              color: Color(0xFFFFC107),
                            ),
                            Icon(
                              Icons.star,
                              color: Color(0xFFFFC107),
                            ),
                            Icon(
                              Icons.star,
                              color: Color(0xFFFFC107),
                            ),
                            Icon(
                              Icons.star,
                              color: sliderColor,
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        Text(
                          'Deskripsi',
                          style: boldText16.copyWith(color: blackColor),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                          style: regularText14,
                        ),
                        SizedBox(height: 24),
                        Row(
                          children: [
                            ContainerIcon(image: 'assets/icons/tanggal.png'),
                            SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Setiap Hari',
                                  style: semiBoldText14.copyWith(
                                      color: blackColor),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '09.00-17.00',
                                  style: regularText12,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        Row(
                          children: [
                            ContainerIcon(image: 'assets/icons/fee.png'),
                            SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Fee',
                                  style: semiBoldText14.copyWith(
                                      color: blackColor),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Rp. 150.000',
                                  style: regularText12,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    height: 360,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: sliderColor),
                      ),
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
                          onTap: () => Get.toNamed(Routes.PESAN_SEKARANG),
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
                ),
              ],
            ),
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
