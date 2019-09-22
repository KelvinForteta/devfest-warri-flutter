import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devfest_warri/components/about_bottom_sheet.dart';
import 'package:devfest_warri/components/devfest_story_card.dart';
import 'package:devfest_warri/components/menu_card.dart';
import 'package:devfest_warri/components/wifi_bottom_sheet.dart';
import 'package:devfest_warri/screens/location_screen.dart';
import 'package:devfest_warri/screens/photos_screen.dart';
import 'package:devfest_warri/screens/speakers_screen.dart';
import 'package:devfest_warri/screens/team_screen.dart';
import 'package:devfest_warri/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart' as url_laucher;

import 'agenda_screen.dart';

class HomeScreen extends StatelessWidget {
  static const ID = 'home_screen';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('DevFest Warri'),
        centerTitle: true,
        leading: InkWell(
          onTap: () {},
          radius: 50,
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/gdg_logo.jpg'),
              //radius: 50,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 200.0,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/devfest-animated-logo.gif'),
              fit: BoxFit.fill,
            )),
          ),
          GestureDetector(
            onTap: () {
              showAboutModelBottomSheet(context, AboutBottomSheet());
            },
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Welcome to DevFest Warri 2019',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Oswald',
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              showAboutModelBottomSheet(context, AboutBottomSheet());
            },
            child: Container(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 10,
              ),
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          'GDG DevFest 2019 is our annual all-day developer conference that offers speaker sessions across multiple product areas, codelabs, hackathon and more! ',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'Read more...',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? 370
                : 450,
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              primary: true,
              padding: const EdgeInsets.all(7.0),
              crossAxisSpacing: 7,
              mainAxisSpacing: 7,
              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 3
                      : 4,
              children: <Widget>[
                MenuCard(
                    image: 'assets/images/time.png',
                    name: 'Agenda',
                    onTapped: () {
                      Navigator.pushNamed(context, AgendaScreen.ID);
                    }),
                MenuCard(
                    image: 'assets/images/speaker.png',
                    name: 'Speakers',
                    onTapped: () {
                      Navigator.pushNamed(context, SpeakersScreen.ID);
                    }),
                MenuCard(
                    image: 'assets/images/team.png',
                    name: 'Team',
                    onTapped: () {
                      Navigator.pushNamed(context, TeamScreen.ID);
                    }),
                MenuCard(
                    image: 'assets/images/twitter.png',
                    name: 'Tweet',
                    onTapped: () {
                      _launchTwitter();
                    }),
                MenuCard(
                    image: 'assets/images/meetup.png',
                    name: 'RSVP',
                    onTapped: () {
                      launchURL(context,
                          'https://www.meetup.com/GDG-Warri/events/263205974/');
                    }),
                MenuCard(
                    image: 'assets/images/map.png',
                    name: 'Location',
                    onTapped: () {
                      Navigator.pushNamed(context, LocationScreen.ID);
                    }),
                MenuCard(
                    image: 'assets/images/photo.png',
                    name: 'Photos',
                    onTapped: () {
                      Navigator.pushNamed(context, PhotosScreen.ID);
                    }),
                MenuCard(
                    image: 'assets/images/cash.png',
                    name: 'Sponsors',
                    onTapped: () {}),
                MenuCard(
                  image: 'assets/images/wifi.png',
                  name: 'WiFi',
                  onTapped: () {
                    showAboutModelBottomSheet(context, WifiBottomSheet());
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            height: 280,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '#DevFestStory #GDGStory',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Oswald',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance
                      .collection('devfest_story')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError)
                      return new Text('Error: ${snapshot.error}');
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      default:
                        return ListView(
                          scrollDirection: Axis.horizontal,
                          children: snapshot.data.documents
                              .map((DocumentSnapshot document) {
                            return DevFestStoryCard(
                              title: document['title'],
                              photo: document['photo'],
                              link: document['link'],
                            );
                          }).toList(),
                        );
                    }
                  },
                )),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Container(
            child: Center(
              child: FlatButton.icon(
                  color: Colors.blue,
                  onPressed: () {
                    launchURL(context,
                        'https://docs.google.com/forms/d/e/1FAIpQLScaBvL2D6b7BJZ7jwtRrWIbXYGnFxSddIFC-0tHnCdgNVmMuA/viewform');
                  },
                  icon: Icon(
                    Icons.file_upload,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Upload Your Story',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                // Use the FontAwesomeIcons class for the IconData
                icon: new Icon(
                  FontAwesomeIcons.twitter,
                  size: 25,
                ),
                onPressed: () {
                  url_laucher.launch('https://twitter.com/gdg_warri');
                },
              ),
              SizedBox(
                width: 5,
              ),
              IconButton(
                // Use the FontAwesomeIcons class for the IconData
                icon: new Icon(
                  FontAwesomeIcons.meetup,
                  size: 25,
                ),
                onPressed: () {
                  url_laucher.launch('https://www.meetup.com/GDG-Warri/');
                },
              ),
              SizedBox(
                width: 5,
              ),
              IconButton(
                // Use the FontAwesomeIcons class for the IconData
                icon: new Icon(
                  FontAwesomeIcons.envelope,
                  size: 25,
                ),
                onPressed: () {
                  url_laucher.launch('mailto:charles.eteure@gmail.com');
                },
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              '@gdg_warri',
              style: TextStyle(fontSize: 15, color: Colors.blue),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  void showAboutModelBottomSheet(context, Widget bottomSheetContent) {
    showModalBottomSheet(
        context: context,
        builder: (context) => bottomSheetContent,
        isScrollControlled: true,
        elevation: 15);
  }
}

_launchTwitter() async {
  const url =
      'https://twitter.com/intent/tweet?text=%23DevFest%20%23DevFestWarri%20@gdg_warri';
  if (await url_laucher.canLaunch(url)) {
    await url_laucher.launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
