import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ladder/app/utils/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonSK extends StatelessWidget {
  const ButtonSK({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _launchURL() async {
      const url = 'https://ladder.my.id/terms-condition';
      if (await canLaunch(url)) {
        Get.defaultDialog(middleText: "Loading....");
        await launch(url);
        Get.back();
      } else {
        throw 'Could not launch $url';
      }
    }

    return GestureDetector(
      onTap: _launchURL,
      child: Card(
        child: ListTile(
          trailing: IconButton(
            onPressed: _launchURL,
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
