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
    return tukang
        .where("keahlian", arrayContains: docName)
        .orderBy('name')
        .snapshots();
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

  // Future<QuerySnapshot<Map<String, dynamic>>> streamData(String docName) async {
  //   final userr = await FirebaseFirestore.instance
  //       .collection('users')
  //       .where("keahlian", arrayContains: docName)
  //       .orderBy('email')
  //       .get();

  //   List<String> emails = [];

  //   userr.docs.forEach((element) {
  //     emails.add(element['email']);
  //   });

  //   // int email = emails.length;

  //   final emailU = firestore
  //       .collection("users")
  //       .doc(userr.toString())
  //       .collection('rating')
  //       .get();

  //   print(emailU);
  //   return emailU;
  // }
}
