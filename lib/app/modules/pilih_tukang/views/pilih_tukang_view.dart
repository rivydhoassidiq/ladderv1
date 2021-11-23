import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ladder/app/controllers/auth_controller.dart';

import 'package:ladder/app/data/models/users_model.dart';
import 'package:ladder/app/routes/app_pages.dart';
import 'package:ladder/app/utils/loading_screen.dart';
import 'package:ladder/app/utils/theme.dart';

import '../controllers/pilih_tukang_controller.dart';

class PilihTukangView extends StatefulWidget {
  const PilihTukangView({Key? key}) : super(key: key);

  @override
  _PilihTukangViewState createState() => _PilihTukangViewState();
}

class _PilihTukangViewState extends State<PilihTukangView> {
  final authC = Get.find<AuthController>();
  PilihTukangController controller = Get.put(PilihTukangController());
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future loadData() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
          'Pilih Tukang',
          style: boldText16.copyWith(color: blackColor),
        ),
      ),
      body: isLoading
          ? Center(
              child: LoadingScreen(),
            )
          : StreamBuilder<QuerySnapshot<UsersModel?>>(
              stream: controller.streamTukangg(Get.arguments),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  var listAllDocs = snapshot.data!.docs;
                  print(listAllDocs.length);
                  return listAllDocs.length == 0
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
                                style:
                                    semiBoldText12.copyWith(color: sliderColor),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: listAllDocs.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () => Get.toNamed(Routes.DETAIL_TUKANG,
                                arguments: listAllDocs[index].id),
                            child: Container(
                              margin:
                                  EdgeInsets.only(top: 16, left: 16, right: 16),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(.5),
                                      offset: Offset(3, 2),
                                      blurRadius: 7)
                                ],
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(
                                      // '${(listAllDocs[index].data() as Map<String, dynamic>)["photoUrl"]}',
                                      '${listAllDocs[index].data()!.photoUrl}',
                                      // authC.userr.value.photoUrl!,
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // '${(listAllDocs[index].data() as Map<String, dynamic>)["name"]}',
                                        '${listAllDocs[index].data()!.name}',
                                        // '${authC.userr.value.name!}',
                                        style: semiBoldText14.copyWith(
                                            color: blackColor),
                                      ),
                                      Icon(Icons.star_rate_rounded,
                                          color: Color(0xFFFFC107))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                }
                return Center(
                  child: LoadingScreen(),
                );
              },
            ),
    );
  }
}
