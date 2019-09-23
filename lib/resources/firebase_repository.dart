import 'package:devfest_warri/resources/firebase_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRepository {
  FirebaseMethods _firebaseMethods = FirebaseMethods();

  Stream getWifiDetails() => _firebaseMethods.getWifiDetails();

  Stream getAgenda() => _firebaseMethods.getAgenda();

  Future<FirebaseUser> signIn() => _firebaseMethods.signIn();
}
