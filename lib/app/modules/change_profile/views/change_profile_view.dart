import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ladder/app/utils/theme.dart';

import '../controllers/change_profile_controller.dart';

class ChangeProfileView extends GetView<ChangeProfileController> {
  final _controller = Get.find<ChangeProfileController>();

  @override
  Widget build(BuildContext context) {
    final sizeC = MediaQuery.of(context).size.height;

    final heightC = sizeC;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
        backgroundColor: whiteColor,
        elevation: 0,
        leadingWidth: 32,
        title: Text(
          'Ubah Profile',
          style: boldText16.copyWith(
            color: blackColor,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Container(
                color: whiteColor,
                width: double.infinity,
                height: heightC - (MediaQuery.of(context).size.height) / 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 17.0),
                      child: Center(
                        child: Container(
                          width: Get.width * 0.25,
                          height: Get.width * 0.25,
                          // color: Colors.amber,
                          child: Stack(
                            fit: StackFit.expand,
                            clipBehavior: Clip.none,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/profilepict.png'),
                              ),
                              Positioned(
                                bottom: -16,
                                right: -10,
                                child: SizedBox(
                                  height: 53,
                                  width: 53,
                                  child: FlatButton(
                                    onPressed: () {},
                                    child:
                                        Image.asset('assets/icons/change.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Container(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nama Lengkap',
                            style: boldText12.copyWith(color: blackColor),
                          ),
                          TextField(
                            controller: _controller.namaC,
                            style: semiBoldText14,
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'Nomor Telepon',
                            style: boldText12.copyWith(color: blackColor),
                          ),
                          TextField(
                            controller: _controller.noTelpC,
                            style: semiBoldText14,
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'Email',
                            style: boldText12.copyWith(color: blackColor),
                          ),
                          TextField(
                            controller: _controller.emailC,
                            style: semiBoldText14,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 100,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: sliderColor,
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: Center(
                              child: InkWell(
                                borderRadius: BorderRadius.circular(4),
                                onTap: () {},
                                child: Text(
                                  'Simpan',
                                  style: semiBoldText14.copyWith(
                                      color: whiteColor),
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
          ],
        ),
      ),
    );
  }
}
