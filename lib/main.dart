import 'package:devfest_warri/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(DevFestWarri());

class DevFestWarri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DevFest Warri',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.white,
          // canvasColor: Colors.grey,
          appBarTheme: AppBarTheme(
            // elevation: 0,
            color: Colors.white,
          )),
      home: HomeScreen(),
    );
  }
}
