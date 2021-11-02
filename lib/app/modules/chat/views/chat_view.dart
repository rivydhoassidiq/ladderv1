import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ladder/app/routes/app_pages.dart';
import 'package:ladder/app/utils/theme.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  final List<Widget> myChats = List.generate(
    20,
    (index) => ListTile(
      onTap: () => Get.toNamed(Routes.CHAT_ROOM),
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/images/profilepict.png'),
        radius: 25,
      ),
      title: Text(
        "Shin Ji Yoon ${index + 1}",
        style: semiBoldText14.copyWith(color: blackColor),
      ),
      subtitle: Text(
        "Shin Ji Yoon ${index + 1}",
        style: regularText12.copyWith(color: blackColor),
      ),
      trailing: Chip(
        label: Text("3"),
      ),
    ),
  ).reversed.toList();
  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    final sizeHeight = MediaQuery.of(context).size.height;

    final widthC = sizeWidth;
    final heightC = sizeHeight;

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: myChats.length == 0
                  ? Center(
                      child: Column(
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
                            'Belum ada pesan',
                            style: boldText16,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Anda bisa mengirim pesan kepada mitra kami disini.',
                            style: semiBoldText12.copyWith(color: sliderColor),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: myChats.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          myChats[index],
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 25.0, right: 25.0),
                            child: Container(
                              // width: widthC - sizeWidth * 0.8,

                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: sliderColor),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
