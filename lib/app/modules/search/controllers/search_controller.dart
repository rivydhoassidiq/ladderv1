import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class SearchController extends GetxController {
  late TextEditingController searchC;

  var queryAwal = [].obs;
  var tempSearch = [].obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void searchData(String data) async {
    print("Search : $data");

    if (data.length == 0) {
      queryAwal.value = [];
      tempSearch.value = [];
    } else {
      var capitalized = data.substring(0, 1).toUpperCase() + data.substring(1);
      print(capitalized);

      if (queryAwal.length == 0 && data.length == 1) {
        // fungsi yang akan dijalankan pada 1 huruf ketikan pertama

        CollectionReference<Map<String, dynamic>> kategori = (await firestore
            .collection("kategori")
            .doc('all')
            .collection('alll'));

        final keyNameResult = await kategori
            .where("keyName", isEqualTo: data.substring(0, 1).toUpperCase())
            .get();

        print("Total Data : ${keyNameResult.docs.length}");
        if (keyNameResult.docs.length > 0) {
          for (int i = 0; i < keyNameResult.docs.length; i++) {
            // ignore: unnecessary_cast
            queryAwal.add(keyNameResult.docs[i].data() as Map<String, dynamic>);
          }
        }
        print("Query Result : ");
        print(queryAwal);
      } else {
        print("Tidak ada data");
      }

      if (queryAwal.length != 0) {
        tempSearch.value = [];
        queryAwal.forEach((element) {
          if (element["name"].startsWith(capitalized)) {
            tempSearch.add(element);
          }
        });
      }
    }

    queryAwal.refresh();
    tempSearch.refresh();
  }

  @override
  void onInit() {
    searchC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    searchC.dispose();
  }
}
