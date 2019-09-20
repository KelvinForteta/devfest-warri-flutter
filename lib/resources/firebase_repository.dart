import 'package:devfest_warri/resources/firebase_methods.dart';

class FirebaseRepository {
  FirebaseMethods _firebaseMethods = FirebaseMethods();

  Stream getWifiDetails() => _firebaseMethods.getWifiDetails();
}
