import 'package:flutter/material.dart';

class SponsorsCard extends StatelessWidget {
  final String name;
  final String photo;

  SponsorsCard({this.name, this.photo});
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(5),
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
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          Icon(Icons.open_in_new)
        ],
      ),
    ) //just for testing, will fill with image later
        );
  }
}
