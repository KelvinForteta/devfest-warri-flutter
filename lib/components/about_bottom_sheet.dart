import 'package:flutter/material.dart';

class AboutBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      // color: Colors.red,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: ListView(
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'About DevFest 2019',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'GDG DevFest 2019 is our annual all-day developer conference that offers speaker sessions across multiple product areas, codelabs, hackathon and more!',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '*Code of Conduct*',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'The GDG Warri is dedicated to providing a harassment-free and inclusive event experience for everyone regardless of gender identity and expression, sexual orientation, disabilities, neurodiversity, physical appearance, body size, ethnicity, nationality, race, age, religion, or other protected category.',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'We do not tolerate harassment of event participants in any form. GDG takes violations of our policy seriously and will respond appropriately.',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
