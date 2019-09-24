import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const ID = 'about_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('About'),
        centerTitle: true,
      ),
      body: About(),
    );
  }
}

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('About GDG Warri'),
    );
  }
}
