import 'package:flutter/material.dart';
import 'package:ladder/app/utils/theme.dart';

class ButtonTentang extends StatelessWidget {
  const ButtonTentang({
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
            'assets/icons/tentang.png',
            width: 24,
            height: 24,
            color: blackColor,
          ),
          hoverColor: Colors.amber,
          title: Text(
            'Tentang',
            style: semiBoldText16.copyWith(
              color: blackColor,
            ),
          ),
        ),
      ),
    );
  }
}
