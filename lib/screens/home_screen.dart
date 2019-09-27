import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devfest_warri/components/about_bottom_sheet.dart';
import 'package:devfest_warri/components/custom_modal_bottom_sheet.dart';
import 'package:devfest_warri/components/devfest_story_card.dart';
import 'package:devfest_warri/components/login_bottom_sheet.dart';
import 'package:devfest_warri/components/menu_card.dart';
import 'package:devfest_warri/components/sponsors_bottom_sheet.dart';
import 'package:devfest_warri/models/menu_item.dart';
import 'package:devfest_warri/screens/location_screen.dart';
import 'package:devfest_warri/screens/speakers_screen.dart';
import 'package:devfest_warri/screens/team_screen.dart';
import 'package:devfest_warri/utils/utilities.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alert/flutter_alert.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart' as url_laucher;

import 'about_screen.dart';
import 'agenda_screen.dart';

class HomeScreen extends StatefulWidget {
  static const ID = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String versionNumber;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    // getCurrentUser();
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      versionNumber = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    FirebaseUser loggedInUser = Provider.of<FirebaseUser>(context);

    bool isLoggedIn() {
      return loggedInUser != null;
    }

    // Menu Items list
    List<MenuItems> menuItems = [
      MenuItems(
        title: Text('Share'),
        icon: Icon(Icons.share),
        name: 'share',
      ),
      isLoggedIn()
          ? MenuItems(
              title: Text('Sign Out'),
              icon: Icon(FontAwesomeIcons.signOutAlt),
              name: 'signout')
          : MenuItems(
              title: Text('Sign In'),
              icon: Icon(FontAwesomeIcons.signInAlt),
              name: 'signin'),
      /* MenuItems(
        title: Text('About'),
        icon: Icon(Icons.info),
        name: 'about',
      ),*/
    ];

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('DevFest Warri'),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(7.0),
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            backgroundImage: isLoggedIn()
                ? NetworkImage(loggedInUser.photoUrl)
                : AssetImage('assets/images/gdg_logo.jpg'),
            //radius: 50,
          ),
        ),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return menuItems.map((MenuItems item) {
                return PopupMenuItem(
                  value: item.name,
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 0),
                    title: item.title,
                    leading: item.icon,
                  ),
                );
              }).toList();
            },
            onSelected: (value) {
              switch (value) {
                case 'share':
                  Share.share('https://devfest.gdgwarri.tech');
                  break;

                case 'signin':
                  // Log the user out
                  customModalBottomSheet(context, LoginBottomSheet());
                  break;

                case 'signout':
                  // Log the user out
                  _showSignOutDialog();
                  break;

                case 'about':
                  Navigator.pushNamed(context, AboutScreen.ID);
                  break;

                default:
              }
            },
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
              customModalBottomSheet(context, AboutBottomSheet());
            },
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Shimmer.fromColors(
                    baseColor: Colors.blue,
                    highlightColor: Colors.green,
                    child: Text(
                      '5 October, 2019',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Oswald',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Welcome to DevFest Warri 2019',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Oswald',
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              customModalBottomSheet(context, AboutBottomSheet());
            },
            child: Container(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 10,
              ),
              child: RichText(
                //  textAlign: TextAlign.justify,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          'GDG DevFest Warri 2019 is our annual all-day developer conference that offers speaker sessions across multiple product areas, codelabs, hackathon and more!...',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    /*TextSpan(
                      text: 'Read more...',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                    ),*/
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
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
                /*MenuCard(
                    image: 'assets/images/photo.png',
                    name: 'Photos',
                    onTapped: () {
                      Navigator.pushNamed(context, PhotosScreen.ID);
                    }),*/
                MenuCard(
                    image: 'assets/images/cash.png',
                    name: 'Sponsors',
                    onTapped: () {
                      customModalBottomSheet(context, SponsorsBottomSheet());
                    }),
                /*MenuCard(
                  image: 'assets/images/wifi.png',
                  name: 'WiFi',
                  onTapped: () {
                    customModalBottomSheet(context, WifiBottomSheet());
                  },
                ),*/
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            height: 280,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Blog Posts',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 28,
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
                      .collection('blog_posts')
                      .orderBy('id', descending: true)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError)
                      return Text('Error: ${snapshot.error}');
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
              'v$versionNumber',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  void _showSignOutDialog() {
    showAlert(
      context: context,
      // title: "Sign out?",
      body: "Are you sure you want to sign out?",
      actions: [
        AlertAction(
          text: "Yes",
          isDestructiveAction: true,
          onPressed: () async {
            _auth.signOut();
            await deleteAccessToken();
            Toast.show("Sign out was successful.", context,
                duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
          },
        ),
      ],
      cancelable: true,
    );
  }

  Future deleteAccessToken() async {
    // remove the access token from shared preference
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('access_token');
  }
}

_launchTwitter() async {
  const url =
      'https://twitter.com/intent/tweet?text=%23DevFest%20%23DevFest19%20%23DevFestWarri%20@gdg%20@gdg_warri%20%23GDG%20%23DevFestStory%20%23GDGStory';
  if (await url_laucher.canLaunch(url)) {
    await url_laucher.launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
