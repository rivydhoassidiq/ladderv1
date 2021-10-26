import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ladder/app/utils/theme.dart';

import '../controllers/pesan_sekarang_controller.dart';

class PesanSekarangView extends GetView<PesanSekarangController> {
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
          'Pesan Sekarang',
          style: boldText16.copyWith(color: blackColor),
        ),
      ),
      body: SafeArea(
        child: Flexible(
          flex: 1,
          child: Container(
            // color: Colors.amber,
            child: Column(
              children: [
                Flexible(
                  flex: 5,
                  child: Container(
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Container(
                          width: 328,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                            border: Border.all(color: blueColorColor),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.info_outline_rounded,
                                  color: blueColorColor),
                              SizedBox(width: 12),
                              Text(
                                'Dimohon untuk konfirmasi kembali detail order',
                                style:
                                    semiBoldText12.copyWith(color: sliderColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24),
                        Container(
                          width: 328,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Alamat',
                                  style:
                                      boldText16.copyWith(color: blackColor)),
                              Container(
                                width: 68,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: pinkColor),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Center(
                                      child: Text(
                                        'Ubah',
                                        style: boldText12.copyWith(
                                            color: pinkColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 9),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: sliderColor,
                        ),
                        SizedBox(height: 16),
                        Container(
                          padding: EdgeInsets.only(left: 16),
                          width: 328,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: blueColorColor,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.location_on, color: whiteColor),
                              SizedBox(width: 16),
                              Text(
                                'Jln. Melati No. 24',
                                style:
                                    semiBoldText14.copyWith(color: whiteColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: 328,
                          height: 40,
                          child: Row(
                            children: [
                              Container(
                                width: 93,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: pinkColor),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Center(
                                      child: Text(
                                        'Detail Alamat',
                                        style: boldText12.copyWith(
                                            color: pinkColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              Container(
                                width: 60,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: pinkColor),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Center(
                                      child: Text(
                                        'Catatan',
                                        style: boldText12.copyWith(
                                            color: pinkColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          color: greyColor,
                          width: double.infinity,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            width: 328,
                            // height: 171,
                            child: Card(
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 16, left: 16, right: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Detail Pembayaran',
                                      style: boldText14.copyWith(
                                          color: blackColor),
                                    ),
                                    SizedBox(height: 16),
                                    Container(
                                      width: double.infinity,
                                      height: 1,
                                      color: sliderColor,
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Harga', style: regularText12),
                                        Text('150.000', style: regularText12),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Biaya Alat',
                                            style: regularText12),
                                        Text('150.000', style: regularText12),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Container(
                                      width: double.infinity,
                                      height: 1,
                                      color: sliderColor,
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Total Harga',
                                            style: semiBoldText12.copyWith(
                                                color: blackColor)),
                                        Text('150.000',
                                            style: semiBoldText12.copyWith(
                                                color: blackColor)),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    // color: Colors.blue,
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: sliderColor)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 328,
                            height: 44,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: blueColorColor,
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(5),
                                onTap: () {},
                                child: Center(
                                  child: Text(
                                    'Konfirmasi',
                                    style:
                                        boldText16.copyWith(color: whiteColor),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Dengan konfirmasi order, anda menyetujui',
                                style:
                                    semiBoldText10.copyWith(color: blackColor),
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Syarat & Ketentuan',
                                style: semiBoldText10.copyWith(
                                    color: blueColorColor),
                              ),
                            ],
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
      ),
    );
  }
}
