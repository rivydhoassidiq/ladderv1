import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ladder/app/routes/app_pages.dart';
import 'package:ladder/app/utils/theme.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../controllers/pilih_tukang_controller.dart';

class PilihTukangView extends StatefulWidget {
  const PilihTukangView({Key? key}) : super(key: key);

  @override
  _PilihTukangViewState createState() => _PilihTukangViewState();
}

class _PilihTukangViewState extends State<PilihTukangView> {
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

    await Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  final List<Widget> profileTukang = List.generate(
    10,
    (index) => GestureDetector(
      onTap: () => Get.toNamed(Routes.DETAIL_TUKANG),
      child: Container(
        margin: EdgeInsets.only(top: 16, left: 16, right: 16),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
              backgroundImage: NetworkImage(
                'https://1409791524.rsc.cdn77.org/data/images/full/567629/blackpink-jisoo-all-black-hip-style-lovely-is-a-bonus.jpg',
              ),
            ),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(100),
            //   child:
            // ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kasim Simalakama',
                  style: semiBoldText14.copyWith(color: blackColor),
                ),
                Icon(Icons.star_rate_rounded, color: Color(0xFFFFC107))
              ],
            ),
          ],
        ),
      ),
    ),
  ).toList();
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
              child: Container(
              width: 100,
              child: LoadingIndicator(
                  indicatorType: Indicator.ballRotateChase,

                  /// Required, The loading type of the widget
                  colors: const [
                    Colors.red,
                    Colors.green,
                    Colors.blue,
                    Colors.yellow,
                    Colors.purple
                  ],

                  /// Optional, The color collections
                  strokeWidth: 2,

                  /// Optional, The stroke of the line, only applicable to widget which contains line
                  backgroundColor: Colors.white,

                  /// Optional, Background of the widget
                  pathBackgroundColor: Colors.white

                  /// Optional, the stroke backgroundColor
                  ),
            ))
          : StreamBuilder<QuerySnapshot<Object?>>(
              stream: controller.streamData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  var listAllDocs = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: listAllDocs.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => Get.toNamed(Routes.DETAIL_TUKANG,
                          arguments: listAllDocs[index].id),
                      child: Container(
                        margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                              backgroundImage: NetworkImage(
                                '${(listAllDocs[index].data() as Map<String, dynamic>)["photoUrl"]}',
                              ),
                            ),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${(listAllDocs[index].data() as Map<String, dynamic>)["name"]}',
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
                    child: Container(
                  width: 100,
                  child: LoadingIndicator(
                      indicatorType: Indicator.ballRotateChase,

                      /// Required, The loading type of the widget
                      colors: const [
                        Colors.red,
                        Colors.green,
                        Colors.blue,
                        Colors.yellow,
                        Colors.purple
                      ],

                      /// Optional, The color collections
                      strokeWidth: 2,

                      /// Optional, The stroke of the line, only applicable to widget which contains line
                      backgroundColor: Colors.white,

                      /// Optional, Background of the widget
                      pathBackgroundColor: Colors.white

                      /// Optional, the stroke backgroundColor
                      ),
                ));
              }),
    );
  }
}
