import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ladder/app/data/models/tukang.dart';
import 'package:ladder/app/data/models/users_model.dart';
// import 'package:ladder/app/data/models/tukang.dart';

class PilihTukangController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final tukang = FirebaseFirestore.instance
      .collection("users")
      // .where('role', isEqualTo: "Tukang")
      .withConverter<UsersModel>(
        fromFirestore: (snapshot, options) =>
            UsersModel.fromJson(snapshot.data()!),
        toFirestore: (value, options) => value.toJson(),
      );

  // Stream<QuerySnapshot<UsersModel>> streamTukangg() {
  //   // print(docID);
  //   return tukang
  //       .where("role", isEqualTo: "Tukang")
  //       // .where('role', isEqualTo: "Tukang")
  //       .snapshots();
  // }

  Stream<QuerySnapshot<UsersModel>> streamTukangg(String docName) {
    return tukang.where("keahlian", arrayContains: docName).snapshots();
  }

  // final tukangAll = FirebaseFirestore.instance
  //     .collection("tukang")
  //     .withConverter<TukangModel>(
  //       fromFirestore: (snapshot, options) =>
  //           TukangModel.fromJson(snapshot.data()!),
  //       toFirestore: (value, options) => value.toJson(),
  //     );
  // Stream<QuerySnapshot<TukangModel>> streamTukang() {
  //   return tukangAll.snapshots();
  // }

  // Stream<QuerySnapshot<Object?>> streamData() {
  //   CollectionReference tukang = firestore.collection("tukang");
  //   return tukang.orderBy('name').snapshots();
  // }
}
