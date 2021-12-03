import 'package:flutter/material.dart';
import 'package:ladder/app/utils/cleaning_page.dart';
import 'package:ladder/app/utils/theme.dart';

class TextCleaning extends StatelessWidget {
  const TextCleaning({
    Key? key,
    required this.sizeWidth,
    required this.widthC,
  }) : super(key: key);

  final double sizeWidth;
  final double widthC;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      // width: sizeWidth - widthC / 9,
      // height: sizeHeight - heightC * 5,
      margin: EdgeInsets.symmetric(horizontal: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Cleaning',
            style: boldText16.copyWith(color: blackColor, fontSize: 14),
          ),
          SizedBox(width: 8),
          Container(
            width: sizeWidth - widthC / 1.5,
            height: 1,
            color: sliderColor,
          ),
          // SizedBox(width: 8),
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CleaningPage(),
              ),
            ),
            child: Text(
              'Lihat Semua',
              style: boldText12.copyWith(color: blueColorColor),
            ),
          ),
        ],
      ),
    );
  }
}
