import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:ladder/app/data/models/reapiring.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var data = [].obs;

  RxList<RepairingModel> cleaning_products = RxList<RepairingModel>([]);

  RxList<RepairingModel> repairing_products = RxList<RepairingModel>([]);

  RxList<RepairingModel> service_products = RxList<RepairingModel>([]);

  // var firebaseFirestore;

  @override
  onReady() {
    super.onReady();
    cleaning_products.bindStream(getAllCleaningProducts());
    repairing_products.bindStream(getAllRepairingProducts());
    service_products.bindStream(getAllServiceProducts());
  }

  // Stream<List<RepairingModel>> getAllCleaningProducts() => firestore
  //     .collection(cleaning_collection)
  //     .snapshots()
  //     .map((query) => query.docs
  //         .map((item) => RepairingModel.fromMap(item.data()))
  //         .toList());
  Stream<List<RepairingModel>> getAllServiceProducts() => firestore
      .collection('kategori')
      .doc('cleaning')
      .collection('cleaningg')
      .snapshots()
      .map((query) => query.docs
          .map((item) => RepairingModel.fromJson(item.data()))
          .toList());

  Stream<List<RepairingModel>> getAllCleaningProducts() => firestore
      .collection('kategori')
      .doc('cleaning')
      .collection('cleaningg')
      .snapshots()
      .map((query) => query.docs
          .map((item) => RepairingModel.fromJson(item.data()))
          .toList());

  Stream<List<RepairingModel>> getAllRepairingProducts() => firestore
      .collection('kategori')
      .doc('repairing')
      .collection('repairingg')
      .snapshots()
      .map((query) => query.docs
          .map((item) => RepairingModel.fromJson(item.data()))
          .toList());
}
