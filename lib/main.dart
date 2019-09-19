import 'package:devfest_warri/screens/agenda_screen.dart';
import 'package:devfest_warri/screens/home_screen.dart';
import 'package:devfest_warri/screens/location_screen.dart';
import 'package:devfest_warri/screens/photos_screen.dart';
import 'package:devfest_warri/screens/speakers_screen.dart';
import 'package:devfest_warri/screens/team_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() => runApp(DevFestWarri());

class DevFestWarri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // change the status bar color to material color [green-400]
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    if (useWhiteForeground(Colors.white)) {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    } else {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DevFest Warri',
      color: Colors.white,
      // This theme would be used when user turn on Dark Mode on Android 10 or Q
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        canvasColor: Colors.transparent,
      ),
      // Default theme
      theme: ThemeData(
        canvasColor: Colors.transparent,
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        // canvasColor: Colors.grey,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.white,
        ),
      ),
      initialRoute: HomeScreen.ID,
      routes: {
        HomeScreen.ID: (context) => HomeScreen(),
        AgendaScreen.ID: (context) => AgendaScreen(),
        LocationScreen.ID: (context) => LocationScreen(),
        PhotosScreen.ID: (context) => PhotosScreen(),
        SpeakersScreen.ID: (context) => SpeakersScreen(),
        TeamScreen.ID: (context) => TeamScreen(),
      },
    );
  }
}
