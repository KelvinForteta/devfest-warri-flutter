import 'package:devfest_warri/components/menu_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart' as url_laucher;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Welcome',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
          ),
          GestureDetector(
            onTap: () {
              print('tapped');
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'GDG DevFest 2019 is our annual all-day developer conference that offers speaker sessions across multiple product areas, codelabs, hackathon and more!..',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
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
                    onTapped: () {}),
                MenuCard(
                    image: 'assets/images/speaker.png',
                    name: 'Speakers',
                    onTapped: () {}),
                MenuCard(
                    image: 'assets/images/team.png',
                    name: 'Team',
                    onTapped: () {}),
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
                      _launchURL(context,
                          'https://www.meetup.com/GDG-Warri/events/263205974/');
                    }),
                MenuCard(
                    image: 'assets/images/map.png',
                    name: 'Location',
                    onTapped: () {}),
                MenuCard(
                    image: 'assets/images/photo.png',
                    name: 'Photos',
                    onTapped: () {}),
                MenuCard(
                    image: 'assets/images/cash.png',
                    name: 'Sponsors',
                    onTapped: () {}),
                MenuCard(
                  image: 'assets/images/wifi.png',
                  name: 'WiFi',
                  onTapped: () {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                // Use the FontAwesomeIcons class for the IconData
                icon: new Icon(
                  FontAwesomeIcons.twitter,
                  size: 30,
                ),
                onPressed: () {
                  url_laucher.launch('https://twitter.com/gdg_warri');
                },
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                // Use the FontAwesomeIcons class for the IconData
                icon: new Icon(
                  FontAwesomeIcons.meetup,
                  size: 30,
                ),
                onPressed: () {
                  url_laucher.launch('https://www.meetup.com/GDG-Warri/');
                },
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                // Use the FontAwesomeIcons class for the IconData
                icon: new Icon(
                  FontAwesomeIcons.envelope,
                  size: 30,
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

  void _launchURL(BuildContext context, String url) async {
    try {
      await launch(
        url,
        option: CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          // animation: new CustomTabsAnimation.slideIn()
          // or user defined animation.
          animation: new CustomTabsAnimation(
            startEnter: 'slide_up',
            startExit: 'android:anim/fade_out',
            endEnter: 'android:anim/fade_in',
            endExit: 'slide_down',
          ),
          extraCustomTabs: <String>[
            // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
            'org.mozilla.firefox',
            // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
            'com.microsoft.emmx',
          ],
        ),
      );
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString());
    }
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
