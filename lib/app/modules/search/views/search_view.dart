import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ladder/app/modules/home/views/components/custom_text.dart';
import 'package:ladder/app/routes/app_pages.dart';

import 'package:ladder/app/utils/theme.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: AppBar(
            backgroundColor: whiteColor,
            elevation: 0,
            leadingWidth: 30,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back,
                color: blackColor,
              ),
            ),
            title: Container(
              width: Get.width,
              height: 44,
              margin: EdgeInsets.only(top: 5),
              child: TextField(
                onChanged: (value) => controller.searchData(value),
                autofocus: true,
                decoration: InputDecoration(
                  focusColor: whiteColor,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  border: OutlineInputBorder(
                    // gapPadding: ,
                    borderSide: BorderSide(color: sliderColor),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => controller.tempSearch.length != 0
              ? ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.tempSearch.length,
                  itemBuilder: (context, index) => Container(
                      height: sizeHeight,
                      child: GridView.count(
                        crossAxisCount: 2,

                        // childAspectRatio: .63,
                        padding: const EdgeInsets.all(10),
                        mainAxisSpacing: 16.0,
                        crossAxisSpacing: 16,
                        children: [
                          GestureDetector(
                            onTap: () => Get.toNamed(Routes.PILIH_TUKANG,
                                arguments:
                                    "${controller.tempSearch[index]['name']}"),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(.5),
                                        offset: Offset(3, 2),
                                        blurRadius: 7)
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      ),
                                      child: Image.network(
                                        // product.image.toString(),
                                        "${controller.tempSearch[index]['image']}",
                                        width: double.infinity,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 12),
                                    child: CustomText(
                                      // text: product.name.toString(),
                                      text:
                                          "${controller.tempSearch[index]['name']}",
                                      size: 18,
                                      weight: FontWeight.bold,
                                      color: whiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: const Image(
                          image: AssetImage('assets/images/kosong.png'),
                          width: 230,
                          height: 230,
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
