import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ladder/app/utils/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class Bantuan extends StatelessWidget {
  const Bantuan({Key? key}) : super(key: key);

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

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
        ),
        title: Text(
          'Bantuan',
          style: boldText14.copyWith(color: blackColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/bro.png',
                height: 200,
                width: 230,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Ada Pertanyaan atau Butuh Bantuan ?',
              style: boldText16.copyWith(color: blackColor),
            ),
            SizedBox(height: 8),
            Text(
              'Jangan ragu untuk menghubungi kami kapan saja, klik kontak dibawah ini',
              style: semiBoldText14.copyWith(color: sliderColor),
            ),
            SizedBox(height: 16),
            GestureDetector(
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
                    'assets/icons/wa.png',
                    width: 25,
                    height: 25,
                  ),
                  hoverColor: Colors.amber,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'WhatsApp',
                        style: semiBoldText14.copyWith(
                          color: blackColor,
                        ),
                      ),
                      Text(
                        '62895338540487',
                        style: semiBoldText16.copyWith(
                          color: blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
