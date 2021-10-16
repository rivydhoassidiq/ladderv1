import 'package:flutter/material.dart';
import 'package:ladder/app/utils/theme.dart';

class ButtonKeluar extends StatelessWidget {
  const ButtonKeluar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: ListTile(
          leading: Image.asset(
            'assets/icons/keluar.png',
            width: 24,
            height: 24,
            color: redColor,
          ),
          hoverColor: Colors.amber,
          title: Text(
            'Keluar',
            style: semiBoldText16.copyWith(
              color: redColor,
            ),
          ),
        ),
      ),
    );
  }
}
