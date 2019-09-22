import 'package:devfest_warri/utils/utilities.dart';
import 'package:flutter/material.dart';

class DevFestStoryCard extends StatelessWidget {
  final String photo;
  final String title;
  final String link;

  DevFestStoryCard({this.title, this.photo, this.link});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchURL(context, link);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Stack(
          children: <Widget>[
            Container(
              width: 300.0,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.grey[200], offset: Offset(5.0, 5.0))
                  ],
                  //color: Colors.black.withOpacity(0.5),
                  image: DecorationImage(
                    image: NetworkImage('$photo'),
                    fit: BoxFit.fill,
                  )),
            ),
            Container(
              height: 250,
              width: 300,
              color: Colors.black.withOpacity(0.4),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$title',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
