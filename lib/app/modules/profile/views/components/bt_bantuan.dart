import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ladder/app/modules/profile/views/components/bantuan.dart';
import 'package:ladder/app/utils/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonBantuan extends StatelessWidget {
  const ButtonBantuan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => Bantuan())),
      child: Card(
        child: ListTile(
          trailing: IconButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Bantuan())),
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
