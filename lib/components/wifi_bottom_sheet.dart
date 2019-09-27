import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devfest_warri/components/available_wifi.dart';
import 'package:devfest_warri/models/wifi_isconnecting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wifi/wifi.dart';

// ignore: must_be_immutable
class WifiBottomSheet extends StatelessWidget {
  String networkSSID;

  Future<void> connectedWifi() async {
    networkSSID = await Wifi.ssid;
    print(networkSSID);
  }

  @override
  Widget build(BuildContext context) {
    bool isConnecting = Provider.of<IsConnecting>(context).isConnecting;
    connectedWifi();
    return Container(
        height: 300,
        // color: Colors.red,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('wifi').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              default:
                return ListView(
                  children:
                      snapshot.data.documents.map((DocumentSnapshot document) {
                    return AvailableWifi(
                      isConnecting: isConnecting,
                      name: document['network_ssid'],
                      password: document['password'],
                      isConnected: networkSSID == document['network_ssid'],
                      onPressed: () async {
                        Provider.of<IsConnecting>(context)
                            .changeConnection(true);
                        var result = await connectToWifi(
                            document['network_ssid'], document['password']);

                        //  isConnecting = false;
                      },
                    );
                  }).toList(),
                );
            }
          },
        ));
  }

  // isConnected(String ssid, String password) {}

  connectToWifi(String ssid, String password) async {
    var result = await Wifi.connection(ssid, password);
    print(result);
    return result;
  }
}
