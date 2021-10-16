import 'package:flutter/material.dart';
import 'package:ladder/app/utils/theme.dart';

class ButtonBantuan extends StatelessWidget {
  const ButtonBantuan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: ListTile(
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.navigate_next,
              size: 30,
              color: blackColor,
            ),
          ),
          leading: Image.asset(
            'assets/icons/bantuan.png',
            width: 24,
            height: 24,
            color: blackColor,
          ),
          hoverColor: Colors.amber,
          title: Text(
            'Bantuan',
            style: semiBoldText16.copyWith(
              color: blackColor,
            ),
          ),
        ),
      ),
    );
  }
}
