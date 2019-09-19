import 'package:devfest_warri/components/menu_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('DevFest Warri'),
        centerTitle: true,
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
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          OrientationBuilder(
            builder: (context, orientation) {
              print(orientation);
              return Container(
                height: orientation == Orientation.portrait ? 370 : 280,
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: true,
                  padding: const EdgeInsets.all(7.0),
                  crossAxisSpacing: 7.0,
                  mainAxisSpacing: 7,
                  crossAxisCount: orientation == Orientation.portrait ? 3 : 4,
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
                        onTapped: () {}),
                    MenuCard(
                        image: 'assets/images/paper.png',
                        name: 'RSVP',
                        onTapped: () {}),
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
              );
            },
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
                  size: 37,
                ),
                onPressed: () {
                  print("Pressed");
                },
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                // Use the FontAwesomeIcons class for the IconData
                icon: new Icon(
                  FontAwesomeIcons.meetup,
                  size: 37,
                ),
                onPressed: () {
                  print("Pressed");
                },
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                // Use the FontAwesomeIcons class for the IconData
                icon: new Icon(
                  FontAwesomeIcons.envelope,
                  size: 37,
                ),
                onPressed: () {
                  print("Pressed");
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
              '#DevFestWarri',
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
