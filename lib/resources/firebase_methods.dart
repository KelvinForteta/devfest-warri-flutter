import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseMethods {
  Firestore firestore = Firestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<QuerySnapshot> getWifiDetails() {
    return firestore.collection('wifi').snapshots();
  }

  Stream<QuerySnapshot> getAgenda() {
    return firestore.collection('agenda').snapshots();
  }

  Future<FirebaseUser> signIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // store the auth token in the shared preference
    _storedAccessToken(googleAuth.accessToken);

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      // store the access token in a share preference
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;

    print(user.email);

    return user;
  }

  _storedAccessToken(String accessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', accessToken);
  }
}
