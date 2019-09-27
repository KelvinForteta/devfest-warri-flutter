import 'dart:io';

import 'package:devfest_warri/components/custom_modal_bottom_sheet.dart';
import 'package:devfest_warri/components/login_bottom_sheet.dart';
import 'package:devfest_warri/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhotosScreen extends StatelessWidget {
  static const ID = 'photos_screen';
  @override
  Widget build(BuildContext context) {
    FirebaseUser loggedInUser = Provider.of<FirebaseUser>(context);

    bool isLoggedIn() {
      return loggedInUser != null;
    }

    fetchPhotosFromAlbumList(loggedInUser);

    return Scaffold(
      backgroundColor: Color(0xffFBFBFB),
      appBar: AppBar(
        title: Text('Photos'),
        centerTitle: true,
        actions: <Widget>[
          isLoggedIn()
              ? IconButton(
                  icon: Icon(Icons.photo_camera),
                  onPressed: () {},
                )
              : Container(),
          isLoggedIn()
              ? IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {},
                )
              : Container()
        ],
      ),
      body: ListView(children: <Widget>[
        isLoggedIn()
            ? UserNotSignedInContainer(
                message:
                    'You need to connect your account to Google Photos before you can view',
                buttonText: 'Connect with Google Photos',
                buttonColor: Colors.green,
                onPress: () {
                  customModalBottomSheet(context, LoginBottomSheet());
                },
              )
            : UserNotSignedInContainer(
                message:
                    'You need to be logged in for you to have access and upload to the DevFest album',
                buttonText: 'Login',
                buttonColor: Colors.blue,
                onPress: () {
                  customModalBottomSheet(context, LoginBottomSheet());
                },
              ),
      ]),
    );
  }

  Future<String> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  Future fetchPhotosFromAlbumList(loggedInUser) async {
    String accessToken = await getAccessToken();
    var url = listAlbumUrl;
    var response = await http.post(url, body: {
      'pageSize': '200',
      'albumId': 'AF1QipPGPbzD5Ze6ZCjL9DsQyAN6mKvqC8lDb9JaM9e4'
    }, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $accessToken'
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}

class UserNotSignedInContainer extends StatelessWidget {
  final String message;
  final Function onPress;
  final String buttonText;
  final Color buttonColor;

  UserNotSignedInContainer({
    this.message,
    this.onPress,
    this.buttonText,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 350,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/photo_illustration.jpg'),
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              '$message',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            )),
        SizedBox(
          height: 40,
        ),
        Container(
          child: FlatButton(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
            child: Text(
              '$buttonText',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            color: buttonColor,
            onPressed: onPress,
          ),
        ),
      ],
    );
  }
}
