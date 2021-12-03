import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ladder/app/utils/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonBantuan extends StatelessWidget {
  const ButtonBantuan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _launchURL() async {
      const url =
          'https://api.whatsapp.com/send/?phone=%2B62895338540487&text=saya%20butuh%20bantuan&app_absent=0';
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
