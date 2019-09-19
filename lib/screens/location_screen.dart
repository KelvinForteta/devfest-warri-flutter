import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  static const ID = 'location_screen';
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
