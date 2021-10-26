import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ladder/app/utils/theme.dart';

import '../controllers/chat_room_controller.dart';

class ChatRoomView extends GetView<ChatRoomController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        leadingWidth: 100,
        leading: InkWell(
          onTap: () => Get.back(),
          borderRadius: BorderRadius.circular(100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 16),
              Icon(
                Icons.arrow_back,
                color: blackColor,
              ),
              SizedBox(width: 16),
              CircleAvatar(
                child: Image.asset('assets/images/noimage.png'),
              ),
            ],
          ),
        ),
        title: Text(
          'Shin Ji Yoon',
          style: boldText16.copyWith(color: blackColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: Get.width,
              // color: Colors.green,
              child: ListView(
                children: [
                  ItemChat(isSender: true),
                  ItemChat(isSender: false),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: context.mediaQueryPadding.bottom),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            width: Get.width,
            // color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Ketik Sesuatu..',
                        hintStyle: regularText12,
                        labelStyle: regularText14,
                        fillColor: Colors.grey[300],
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Material(
                  borderRadius: BorderRadius.circular(100),
                  color: blueColorColor,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Icon(
                        Icons.send,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemChat extends StatelessWidget {
  const ItemChat({
    Key? key,
    required this.isSender,
  }) : super(key: key);

  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 20,
      ),
      // color: Colors.amber,
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isSender ? blueColorColor : Colors.grey[300],
              borderRadius: isSender
                  ? BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    )
                  : BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
            ),
            padding: EdgeInsets.all(10),
            child: Text(
              'Dimana mki ?',
              style: isSender
                  ? regularText12.copyWith(color: whiteColor)
                  : regularText12.copyWith(color: blackColor),
            ),
          ),
          SizedBox(height: 5),
          Text('18:22 PM')
        ],
      ),
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
    );
  }
}
