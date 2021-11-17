import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailTukangController extends GetxController {
  // late Text hargaC;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection('tukang').doc(docID);
    return docRef.get();
  }

  Future<QuerySnapshot<Object?>> getDataa() async {
    CollectionReference tukang = firestore.collection("tukang");

    return tukang.get();
  }
}
