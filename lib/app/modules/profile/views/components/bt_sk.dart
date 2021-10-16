import 'package:flutter/material.dart';
import 'package:ladder/app/utils/theme.dart';

class ButtonSK extends StatelessWidget {
  const ButtonSK({
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
            'assets/icons/sk.png',
            width: 24,
            height: 24,
            color: blackColor,
          ),
          hoverColor: Colors.amber,
          title: Text(
            'Syarat dan Ketentuan',
            style: semiBoldText16.copyWith(
              color: blackColor,
            ),
          ),
        ),
      ),
    );
  }
}
