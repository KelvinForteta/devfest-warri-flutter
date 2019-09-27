import 'package:avatar_glow/avatar_glow.dart';
import 'package:devfest_warri/utils/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SpeakersCard extends StatelessWidget {
  final String photo;
  final String name;
  final String location;
  final String position;
  final String twitter;
  final String facebook;
  final String github;
  final String linkedIn;
  final String web;
  final String email;
  final String speakOn;
  final String type;

  SpeakersCard(
      {this.photo,
      this.name,
      this.location,
      this.position,
      this.twitter,
      this.facebook,
      this.github,
      this.linkedIn,
      this.web,
      this.email,
      this.speakOn,
      this.type});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 4),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AvatarGlow(
                startDelay: Duration(milliseconds: 1000),
                glowColor: Colors.blue,
                endRadius: 70.0,
                duration: Duration(milliseconds: 2000),
                repeat: true,
                showTwoGlows: true,
                repeatPauseDuration: Duration(milliseconds: 100),
                child: Material(
                  elevation: 8.0,
                  shape: CircleBorder(),
                  color: Colors.transparent,
                  child: photo.isNotEmpty
                      ? CircleAvatar(
                          backgroundImage: NetworkImage('$photo'),
                          radius: 50.0,
                        )
                      : CircleAvatar(
                          radius: 50.0,
                          backgroundColor: Colors.green,
                          child: Text(
                            '${name.substring(0, 1)}',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                ),
              ),
              Text(
                '$name',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    size: 18,
                  ),
                  Text(
                    '$location',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ],
              ),
              Text(
                '$position',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17, color: Colors.grey[600]),
              ),
              speakOn != null
                  ? Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        type == 'speaker'
                            ? Icon(
                                Icons.mic,
                                size: 22,
                                color: Colors.blue,
                              )
                            : Icon(
                                Icons.person,
                                size: 22,
                                color: Colors.blue,
                              ),
                        Text(
                          '$speakOn',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                      ],
                    )
                  : Container(),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 5,
                // thickness: 1,
                color: Colors.grey,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  twitter != null
                      ? IconButton(
                          icon: Icon(FontAwesomeIcons.twitter),
                          onPressed: () {
                            launchURL(context, '$twitter');
                          },
                        )
                      : Container(),
                  facebook != null
                      ? IconButton(
                          icon: Icon(FontAwesomeIcons.facebook),
                          onPressed: () {
                            launchURL(context, '$facebook');
                          },
                        )
                      : Container(),
                  github != null
                      ? IconButton(
                          icon: Icon(
                            FontAwesomeIcons.github,
                          ),
                          onPressed: () {
                            launchURL(context, '$github');
                          },
                        )
                      : Container(),
                  linkedIn != null
                      ? IconButton(
                          icon: Icon(FontAwesomeIcons.linkedinIn),
                          onPressed: () {
                            launchURL(context, '$linkedIn');
                          },
                        )
                      : Container(),
                  web != null
                      ? IconButton(
                          icon: Icon(FontAwesomeIcons.globe),
                          onPressed: () {
                            launchURL(context, '$web');
                          },
                        )
                      : Container(),
                  email != null
                      ? IconButton(
                          icon: Icon(FontAwesomeIcons.envelope),
                          onPressed: () {
                            _launchLink('$email');
                          },
                        )
                      : Container()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _launchLink(String link) async {
    String url = '$link';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
