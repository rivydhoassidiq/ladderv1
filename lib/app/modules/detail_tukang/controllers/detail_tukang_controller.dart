import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ladder/app/data/models/users_model.dart';

class DetailTukangController extends GetxController {
  // late Text hargaC;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final tukangAll =
      FirebaseFirestore.instance.collection("users").withConverter<UsersModel>(
            fromFirestore: (snapshot, options) =>
                UsersModel.fromJson(snapshot.data()!),
            toFirestore: (value, options) => value.toJson(),
          );

  Future<DocumentSnapshot<UsersModel>> getDataaa(String docID) async {
    return tukangAll.doc(docID).get();
  }

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection('tukang').doc(docID);
    return docRef.get();
  }

  Future<QuerySnapshot<Object?>> getDataa() async {
    CollectionReference tukang = firestore.collection("tukang");

    return tukang.get();
  }
}
