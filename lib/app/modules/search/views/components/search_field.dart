import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ladder/app/routes/app_pages.dart';
import 'package:ladder/app/utils/theme.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required this.heightC,
    required this.sizeHeight,
  }) : super(key: key);

  final double heightC;
  final double sizeHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 30,
        left: 16,
        right: 16,
      ),
      // color: Colors.red,
      width: double.infinity,
      height: heightC - sizeHeight / 1.15,
      child: TextField(
        onTap: () => Get.toNamed(Routes.SEARCH),
        autofocus: false,
        decoration: InputDecoration(
          focusColor: whiteColor,
          suffixIcon:
              IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined)),
          border: OutlineInputBorder(
            // gapPadding: ,
            borderSide: BorderSide(color: sliderColor),
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ),
      ),
    );
  }
}
