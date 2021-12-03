import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ladder/app/controllers/auth_controller.dart';
import 'package:ladder/app/routes/app_pages.dart';
import 'package:ladder/app/utils/theme.dart';

import '../controllers/chat_room_controller.dart';

class ChatRoomView extends GetView<ChatRoomController> {
  // void closeKeyboard(BuildContext context) {
  //   FocusScopeNode currentFocus = FocusScope.of(context);
  //   if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null)
  //     FocusManager.instance.primaryFocus!.unfocus();
  // }

  final authC = Get.find<AuthController>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String chat_id = (Get.arguments as Map<String, dynamic>)["chat_id"];
  final String emailFriend =
      (Get.arguments as Map<String, dynamic>)["friendEmail"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        leadingWidth: 100,
        automaticallyImplyLeading: true,
        leading: InkWell(
          // onTap: () => Get.offAllNamed(Routes.BOTTOM_NAV_BAR),
          onTap: () => Get.toNamed(Routes.CHAT, arguments: emailFriend),
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
                child: StreamBuilder<DocumentSnapshot<Object?>>(
                    stream: controller.streamFriendData(
                        (Get.arguments as Map<String, dynamic>)["friendEmail"]),
                    builder: (context, snapFriendUser) {
                      if (snapFriendUser.connectionState ==
                          ConnectionState.active) {
                        var dataFriend =
                            snapFriendUser.data!.data() as Map<String, dynamic>;

                        return ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            dataFriend["photoUrl"],
                            fit: BoxFit.cover,
                          ),
                        );
                      }
                      return ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            'assets/images/noimage.png',
                          ));
                    }),
              ),
            ],
          ),
        ),
        title: StreamBuilder<DocumentSnapshot<Object?>>(
            stream: controller.streamFriendData(
                (Get.arguments as Map<String, dynamic>)["friendEmail"]),
            builder: (context, snapFriendUser) {
              if (snapFriendUser.connectionState == ConnectionState.active) {
                var dataFriend =
                    snapFriendUser.data!.data() as Map<String, dynamic>;
                return Text(
                  dataFriend["name"],
                  style: boldText16.copyWith(color: blackColor),
                );
              }
              return Text(
                'Loading ...',
                style: boldText16.copyWith(color: blackColor),
              );
            }),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Get.offAllNamed(Routes.CHAT);
          return false;
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: Get.width,
                // color: Colors.green,
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: controller.streamChats(chat_id),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      var allData = snapshot.data!.docs;
                      Timer(
                        Duration.zero,
                        () => controller.scrollController.jumpTo(controller
                            .scrollController.position.maxScrollExtent),
                      );
                      return ListView.builder(
                        controller: controller.scrollController,
                        itemCount: allData.length,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Column(
                              children: [
                                Text("${allData[index]["groupTime"]}"),
                                ItemChat(
                                  isSender: allData[index]["pengirim"] ==
                                          authC.user.value.email!
                                      ? true
                                      : false,
                                  msg: "${allData[index]["msg"]}",
                                  time: "${allData[index]["time"]}",
                                ),
                              ],
                            );
                          } else {
                            if (allData[index]["groupTime"] ==
                                allData[index - 1]["groupTime"]) {
                              return ItemChat(
                                isSender: allData[index]["pengirim"] ==
                                        authC.user.value.email!
                                    ? true
                                    : false,
                                msg: "${allData[index]["msg"]}",
                                time: "${allData[index]["time"]}",
                              );
                            } else {
                              return Column(
                                children: [
                                  Text("${allData[index]["groupTime"]}"),
                                  ItemChat(
                                    isSender: allData[index]["pengirim"] ==
                                            authC.user.value.email!
                                        ? true
                                        : false,
                                    msg: "${allData[index]["msg"]}",
                                    time: "${allData[index]["time"]}",
                                  ),
                                ],
                              );
                            }
                          }
                        },
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
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
                        autocorrect: false,
                        controller: controller.chatC,
                        onEditingComplete: () {
                          controller.newChat(
                            authC.user.value.email!,
                            Get.arguments as Map<String, dynamic>,
                            controller.chatC.text,
                          );
                          // closeKeyboard(context);
                        },
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
                      onTap: () {
                        controller.newChat(
                          authC.user.value.email!,
                          Get.arguments as Map<String, dynamic>,
                          controller.chatC.text,
                        );
                        // closeKeyboard(context);
                      },
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
      ),
    );
  }
}

class ItemChat extends StatelessWidget {
  const ItemChat({
    Key? key,
    required this.isSender,
    required this.msg,
    required this.time,
  }) : super(key: key);

  final bool isSender;
  final String msg;
  final String time;

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
              '$msg',
              style: isSender
                  ? regularText12.copyWith(color: whiteColor)
                  : regularText12.copyWith(color: blackColor),
            ),
          ),
          SizedBox(height: 5),
          Text(DateFormat.jm().format(DateTime.parse(time))),
        ],
      ),
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
    );
  }
}
