import 'package:flutter/material.dart';

class PhotosScreen extends StatelessWidget {
  static const ID = 'photos_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Photos'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Photos Page'),
      ),
    );
  }
}
