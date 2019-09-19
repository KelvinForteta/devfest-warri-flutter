import 'package:flutter/material.dart';

class SpeakersScreen extends StatelessWidget {
  static const ID = 'speakers_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Speakers'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Speakers Page'),
      ),
    );
  }
}
