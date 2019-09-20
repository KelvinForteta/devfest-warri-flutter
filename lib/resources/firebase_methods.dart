import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseMethods {
  Firestore firestore = Firestore.instance;

  Stream<QuerySnapshot> getWifiDetails() {
    return firestore.collection('wifi').snapshots();
  }
}
