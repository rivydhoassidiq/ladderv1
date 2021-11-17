import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
// import 'package:ladder/app/data/models/tukang.dart';

class PilihTukangController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // var data = [].obs;

  // RxList<TukangModel> tukang = RxList<TukangModel>([]);

  // @override
  // onReady() {
  //   super.onReady();
  //   tukang.bindStream(getAllTukang());
  // }

  // Stream<List<TukangModel>> getAllTukang() =>
  //     firestore.collection('tukang').snapshots().map(
  //           (query) => query.docs
  //               .map((item) => TukangModel.fromMap(item.data()))
  //               .toList(),
  // );

  // Future<QuerySnapshot<Object?>> getData() async {
  //   CollectionReference products = firestore.collection("tukang");

  //   return products.get();
  // }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference tukang = firestore.collection("tukang");
    return tukang.orderBy('name').snapshots();
  }
}
