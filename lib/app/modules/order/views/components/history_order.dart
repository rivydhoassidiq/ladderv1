import 'package:flutter/material.dart';
import 'package:ladder/app/utils/theme.dart';

class HistoryOrder extends StatelessWidget {
  const HistoryOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          // color: Colors.amber,
          margin: const EdgeInsets.only(top: 83),
          // width: 230,
          // height: 230,
          child: const Image(
            image: AssetImage('assets/images/kosong.png'),
            width: 230,
            height: 230,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Belum ada servis',
          style: boldText16,
        ),
        const SizedBox(height: 16),
        Text(
          'Anda bisa memantau servis anda disini.',
          style: semiBoldText12.copyWith(color: sliderColor),
        ),
      ],
    );
  }
}
