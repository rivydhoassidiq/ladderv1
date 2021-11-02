import 'package:flutter/material.dart';
import 'package:ladder/app/data/models/reapiring.dart';
import 'package:ladder/app/modules/home/views/components/custom_text.dart';
import 'package:ladder/app/utils/theme.dart';

class SearchProductWidget extends StatelessWidget {
  final RepairingModel product;

  SearchProductWidget({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
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
                product.image.toString(),
                width: double.infinity,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: CustomText(
              text: product.name.toString(),
              size: 18,
              weight: FontWeight.bold,
              color: whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
