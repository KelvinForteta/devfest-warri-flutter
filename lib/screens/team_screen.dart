import 'package:flutter/material.dart';

class TeamScreen extends StatelessWidget {
  static const ID = 'team_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Team'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Team Page'),
      ),
    );
  }
}
