import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  static const ID = 'location_screen';

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Location'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Location Page'),
      ),
    );
  }
}
