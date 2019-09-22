import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatefulWidget {
  static const ID = 'location_screen';

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(5.563016, 5.766086),
    zoom: 17,
  );

  @override
  Widget build(BuildContext context) {
    final String venueName = 'Manuex Place Event Centre & Hotel';
    final String address = '209a Jakpa Road · Warri';
    // change the status bar to be transparent
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: {manuexPlace},
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              height: 52,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top: BorderSide(
                    width: 1,
                    color: Colors.grey[100],
                  ))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                        ),
                        onPressed: () {
                          // close the screen
                          Navigator.pop(context);
                          // change the status bar color to white
                          FlutterStatusbarcolor.setStatusBarColor(Colors.white);
                        }),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        venueName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        address,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Marker manuexPlace = Marker(
    markerId: MarkerId('manuexPlace'),
    position: LatLng(5.563016, 5.766086),
    infoWindow: InfoWindow(
        title: 'Manuex Place Event Centre & Hotel',
        snippet: '209a Jakpa Road · Warri'),
    visible: true,
    icon: BitmapDescriptor.defaultMarker,
  );
}
