import 'package:flutter/material.dart';

class SponsorsCard extends StatelessWidget {
  final String name;
  final String photo;

  SponsorsCard({this.name, this.photo});
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage('$photo'),
        ),
        Text(
          '$name',
          style: TextStyle(fontSize: 15),
        )
      ],
    ) //just for testing, will fill with image later
        );
  }
}
