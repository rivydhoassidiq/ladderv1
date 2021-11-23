import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ladder/app/controllers/auth_controller.dart';

import 'package:ladder/app/utils/theme.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  final authC = Get.find<AuthController>();
  final controller1 = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              Expanded(
                child:
                    // myChats.length == 0
                    //     ? Center(
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           // crossAxisAlignment: CrossAxisAlignment.center,
                    //           children: [
                    //             Container(
                    //               // color: Colors.amber,
                    //               margin: const EdgeInsets.only(top: 83),
                    //               // width: 230,
                    //               // height: 230,
                    //               child: const Image(
                    //                 image: AssetImage('assets/images/kosong.png'),
                    //                 width: 230,
                    //                 height: 230,
                    //               ),
                    //             ),
                    //             const SizedBox(height: 16),
                    //             Text(
                    //               'Belum ada pesan',
                    //               style: boldText16,
                    //             ),
                    //             const SizedBox(height: 16),
                    //             Text(
                    //               'Anda bisa mengirim pesan kepada mitra kami disini.',
                    //               style: semiBoldText12.copyWith(color: sliderColor),
                    //             ),
                    //           ],
                    //         ),
                    //       )
                    //     :
                    StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: controller1.chatsStream(authC.user.value.email!),
                  builder: (context, snapshot1) {
                    if (snapshot1.connectionState == ConnectionState.active) {
                      var allChats = snapshot1.data!.docs;

                      return ListView.builder(
                          itemCount: allChats.length,
                          itemBuilder: (context, index) {
                            return StreamBuilder<
                                DocumentSnapshot<Map<String, dynamic>>>(
                              stream: controller1
                                  .friendStream(allChats[index]["connection"]),
                              builder: (context, snapshot2) {
                                if (snapshot2.connectionState ==
                                    ConnectionState.active) {
                                  var data = snapshot2.data!.data();
                                  return Column(
                                    children: [
                                      ListTile(
                                        onTap: () => controller1.goToChatRoom(
                                            "${allChats[index].id}",
                                            authC.user.value.email!,
                                            allChats[index]["connection"]),
                                        leading: CircleAvatar(
                                          backgroundColor: whiteColor,
                                          backgroundImage: NetworkImage(
                                            "${data!["photoUrl"]}",
                                          ),
                                          radius: 25,
                                        ),
                                        title: Text(
                                          "${data["name"]}",
                                          style: semiBoldText14.copyWith(
                                              color: blackColor),
                                        ),
                                        trailing: allChats[index]
                                                    ["total_unread"] ==
                                                0
                                            ? Text(
                                                "${allChats[index]["lastTime"]}"
                                                    .substring(11, 16),
                                                style: regularText12.copyWith(
                                                    color: Colors.grey),
                                              )
                                            : Chip(
                                                backgroundColor: blueColorColor,
                                                label: Text(
                                                  "${allChats[index]["total_unread"]}",
                                                  style: regularText12.copyWith(
                                                      color: whiteColor),
                                                ),
                                              ),
                                      ),
                                      // SizedBox(height: 16),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 25.0, right: 25.0),
                                        child: Divider(
                                          color: sliderColor,
                                          thickness: 0.5,
                                          height: 16,
                                        ),
                                      ),
                                    ],
                                  );
                                }
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            );
                          });
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
