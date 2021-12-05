import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ladder/app/controllers/auth_controller.dart';
import 'package:ladder/app/routes/app_pages.dart';
import 'package:ladder/app/utils/theme.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required this.heightC,
    required this.sizeHeight,
  }) : super(key: key);

  final double heightC;
  final double sizeHeight;

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 30,
            left: 16,
            right: 16,
          ),
          // color: Colors.red,
          width: MediaQuery.of(context).size.width / 1.20,
          // width: double.infinity,
          height: heightC - sizeHeight / 1.15,
          child: TextField(
            onTap: () => Get.toNamed(Routes.SEARCH),
            autofocus: false,
            decoration: InputDecoration(
              focusColor: whiteColor,
              suffixIcon: IconButton(
                  onPressed: () {}, icon: Icon(Icons.search_outlined)),
              border: OutlineInputBorder(
                // gapPadding: ,
                borderSide: BorderSide(color: sliderColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
            ),
          ),
        ),
        Container(
          // alignment: Alignment.center,
          // color: Colors.amber,
          // padding: EdgeInsets.only(top: 20),
          height: heightC - sizeHeight / 1.15,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(authC.user.value.email)
                  .collection("chats")
                  .snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return GestureDetector(
                    onTap: () => Get.toNamed(Routes.CHAT),
                    child: Image.asset(
                      'assets/icons/chat.png',
                      // height: 24,
                      width: Get.width / 14,
                    ),
                  );
                }
                // var allChats = snapshot.data!.docs;
                List<int> chats = [];
                snapshot.data.docs.forEach((element) {
                  final map2 = element.data();
                  chats.add(map2['total_unread']);
                });
                int chat1 = (chats.sum);

                return chat1 != 0
                    ? GestureDetector(
                        onTap: () => Get.toNamed(Routes.CHAT),
                        child: Image.asset(
                          'assets/icons/chat_masuk.png',
                          // height: 24,
                          width: Get.width / 14,
                        ),
                      )
                    : GestureDetector(
                        onTap: () => Get.toNamed(Routes.CHAT),
                        child: Image.asset(
                          'assets/icons/chat.png',
                          // height: 24,
                          width: Get.width / 14,
                        ),
                      );
              }),
        )
      ],
    );
  }
}
