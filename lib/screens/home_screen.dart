import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              image: AssetImage('assets/images/devfest.png'),
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'GDG DevFest 2019 is our annual all-day developer conference that offers speaker sessions across multiple product areas, codelabs, hackathon and more!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            height: 390,
            child: GridView.count(
              shrinkWrap: true,
              primary: true,
              padding: const EdgeInsets.all(7.0),
              crossAxisSpacing: 7.0,
              mainAxisSpacing: 7,
              crossAxisCount: 3,
              children: <Widget>[
                CardWidget(
                    image: 'assets/images/agenda2.png',
                    name: 'Agenda',
                    onTapped: () {}),
                CardWidget(
                    image: 'assets/images/speaker.png',
                    name: 'Speakers',
                    onTapped: () {}),
                CardWidget(
                    image: 'assets/images/team.png',
                    name: 'Team',
                    onTapped: () {}),
                CardWidget(
                    image: 'assets/images/twitter.png',
                    name: 'Tweet',
                    onTapped: () {}),
                CardWidget(
                    image: 'assets/images/paper.png',
                    name: 'RSVP',
                    onTapped: () {}),
                CardWidget(
                    image: 'assets/images/map.png',
                    name: 'Location',
                    onTapped: () {}),
                CardWidget(
                    image: 'assets/images/photo.png',
                    name: 'Photos',
                    onTapped: () {}),
                CardWidget(
                    image: 'assets/images/bag_cash_money_64px.png',
                    name: 'Sponsors',
                    onTapped: () {}),
                CardWidget(
                  image: 'assets/images/wifi.png',
                  name: 'WiFi',
                  onTapped: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String image;
  final String name;
  final Function onTapped;

  CardWidget({@required this.image, @required this.name, this.onTapped});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: true,
      onTap: onTapped,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                '$image',
                height: 55,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '$name',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
