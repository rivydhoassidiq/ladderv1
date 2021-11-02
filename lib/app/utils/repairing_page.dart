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
        // child: Container(
        //   width: sizeWidth,
        //   height: sizeHeight,
        //   padding: EdgeInsets.only(
        //     left: 16,
        //     right: 16,
        //   ),
        //   // color: Colors.amber,
        //   child: Column(
        //     children: [
        //       Container(
        //         width: sizeWidth,
        //         child: Row(
        //           children: [
        //             Flexible(
        //               flex: 1,
        //               child: Card(
        //                 elevation: 2,
        //                 child: Column(
        //                   children: [
        //                     Container(
        //                       child: Image.asset(
        //                         'assets/images/lampu3.png',
        //                         // width: 156,
        //                         // height: 120,
        //                       ),
        //                     ),
        //                     Padding(
        //                       padding: const EdgeInsets.symmetric(
        //                           horizontal: 12.0, vertical: 12.0),
        //                       child: Row(
        //                         children: [
        //                           Text(
        //                             'Lampu',
        //                             style: semiBoldText14.copyWith(
        //                                 color: blackColor),
        //                           ),
        //                           SizedBox(width: 50),
        //                           Image.asset(
        //                             'assets/icons/komen.png',
        //                             width: 13,
        //                             height: 13,
        //                           ),
        //                           SizedBox(width: 8),
        //                           Text('50', style: regularText12),
        //                         ],
        //                       ),
        //                     ),
        //                     Padding(
        //                       padding: const EdgeInsets.only(
        //                           left: 12.0, bottom: 12.0),
        //                       child: Row(
        //                         children: [
        //                           Icon(
        //                             Icons.star,
        //                             color: Color(0xFFFFC107),
        //                             size: 16,
        //                           ),
        //                           SizedBox(width: 5),
        //                           Text('4.0', style: regularText12),
        //                         ],
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //             Flexible(
        //               flex: 1,
        //               child: Card(
        //                 elevation: 2,
        //                 child: Column(
        //                   children: [
        //                     Container(
        //                       child: Image.asset(
        //                         'assets/images/keran.png',
        //                         // width: 156,
        //                         // height: 120,
        //                       ),
        //                     ),
        //                     Padding(
        //                       padding: const EdgeInsets.symmetric(
        //                           horizontal: 12.0, vertical: 12.0),
        //                       child: Row(
        //                         children: [
        //                           Text(
        //                             'Keran',
        //                             style: semiBoldText14.copyWith(
        //                                 color: blackColor),
        //                           ),
        //                           SizedBox(width: 50),
        //                           Image.asset(
        //                             'assets/icons/komen.png',
        //                             width: 13,
        //                             height: 13,
        //                           ),
        //                           SizedBox(width: 8),
        //                           Text('50', style: regularText12),
        //                         ],
        //                       ),
        //                     ),
        //                     Padding(
        //                       padding: const EdgeInsets.only(
        //                           left: 12.0, bottom: 12.0),
        //                       child: Row(
        //                         children: [
        //                           Icon(
        //                             Icons.star,
        //                             color: Color(0xFFFFC107),
        //                             size: 16,
        //                           ),
        //                           SizedBox(width: 5),
        //                           Text('4.0', style: regularText12),
        //                         ],
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       Container(
        //         width: sizeWidth,
        //         child: Row(
        //           children: [
        //             Flexible(
        //               flex: 1,
        //               child: Card(
        //                 elevation: 2,
        //                 child: Column(
        //                   children: [
        //                     Container(
        //                       child: Image.asset(
        //                         'assets/images/ac.png',
        //                         // width: 156,
        //                         // height: 120,
        //                       ),
        //                     ),
        //                     Padding(
        //                       padding: const EdgeInsets.symmetric(
        //                           horizontal: 12.0, vertical: 12.0),
        //                       child: Row(
        //                         children: [
        //                           Text(
        //                             'AC',
        //                             style: semiBoldText14.copyWith(
        //                                 color: blackColor),
        //                           ),
        //                           SizedBox(width: 75),
        //                           Image.asset(
        //                             'assets/icons/komen.png',
        //                             width: 13,
        //                             height: 13,
        //                           ),
        //                           SizedBox(width: 8),
        //                           Text('50', style: regularText12),
        //                         ],
        //                       ),
        //                     ),
        //                     Padding(
        //                       padding: const EdgeInsets.only(
        //                           left: 12.0, bottom: 12.0),
        //                       child: Row(
        //                         children: [
        //                           Icon(
        //                             Icons.star,
        //                             color: Color(0xFFFFC107),
        //                             size: 16,
        //                           ),
        //                           SizedBox(width: 5),
        //                           Text('4.0', style: regularText12),
        //                         ],
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //             Flexible(
        //               flex: 1,
        //               child: Card(
        //                 elevation: 2,
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Container(
        //                       child: Image.asset(
        //                         'assets/images/pompa_air.png',
        //                         // width: 156,
        //                         // height: 120,
        //                       ),
        //                     ),
        //                     Padding(
        //                       padding: const EdgeInsets.symmetric(
        //                           horizontal: 12.0, vertical: 12.0),
        //                       child: Row(
        //                         children: [
        //                           Text(
        //                             'Pompa Air',
        //                             style: semiBoldText14.copyWith(
        //                                 color: blackColor),
        //                           ),
        //                           SizedBox(width: 23),
        //                           Image.asset(
        //                             'assets/icons/komen.png',
        //                             width: 13,
        //                             height: 13,
        //                           ),
        //                           SizedBox(width: 8),
        //                           Text('50', style: regularText12),
        //                         ],
        //                       ),
        //                     ),
        //                     Padding(
        //                       padding: const EdgeInsets.only(
        //                           left: 12.0, bottom: 12.0),
        //                       child: Row(
        //                         children: [
        //                           Icon(
        //                             Icons.star,
        //                             color: Color(0xFFFFC107),
        //                             size: 16,
        //                           ),
        //                           SizedBox(width: 5),
        //                           Text('4.0', style: regularText12),
        //                         ],
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
