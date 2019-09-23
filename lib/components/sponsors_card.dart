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
        Image.network(
          '$photo',
          height: 100,
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
