import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ladder/app/utils/theme.dart';

class RoundedButtonGG extends StatelessWidget {
  const RoundedButtonGG({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: googleColor,
        ),
        padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 40,
              height: 30,
            ),
            const SizedBox(width: 5),
            Text(
              title,
              style: boldText16.copyWith(
                color: whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
