import 'package:devfest_warri/resources/firebase_repository.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toast/toast.dart';

class LoginBottomSheet extends StatelessWidget {
  final FirebaseRepository _firebaseRepository = FirebaseRepository();
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        // color: Colors.red,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Center(
          child: FlatButton.icon(
            onPressed: () {
              // call the sign in method
              processLogin(context);
            },
            icon: Icon(
              FontAwesomeIcons.google,
              color: Colors.white,
            ),
            label: Text(
              'Sign in with Google',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red,
          ),
        ));
  }

  void processLogin(BuildContext context) async {
    try {
      var auth = await _firebaseRepository.signIn();
      if (auth != null) {
        Navigator.pop(context);
        Toast.show("You are now signed in.", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      } else {
        Toast.show("An error occurred. Try again.", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      }
    } catch (e) {
      Toast.show("An error occurred. Try again.", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }
  }
}
