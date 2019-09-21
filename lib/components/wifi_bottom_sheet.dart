import 'package:devfest_warri/components/available_wifi.dart';
import 'package:devfest_warri/resources/firebase_repository.dart';
import 'package:flutter/material.dart';
import 'package:wifi_configuration/wifi_configuration.dart';

class WifiBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseRepository _repository = FirebaseRepository();

    /*getPackageName() async {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String packageName = packageInfo.packageName;
      String connectionState = await WifiConfiguration.connectToWifi(
          "AndroidWifi", "", "packageName");
      print(connectionState);
      getWifiConnections();
    }

    getPackageName();*/

    return Container(
      height: MediaQuery.of(context).size.height - 100,
      // color: Colors.red,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: ListView(
        children: <Widget>[
          AvailableWifi(
            name: 'WiFi One',
            onPressed: () {},
            buttonText: 'Connect',
            canConnect: true,
            password: 'BlueLove',
            isConnecting: true,
          ),
          AvailableWifi(
            name: 'Free Internet',
            onPressed: null,
            buttonText: 'Not Available',
            canConnect: false,
          ),
          AvailableWifi(
            name: 'Genesisville',
            onPressed: () {},
            buttonText: 'Connected',
            canConnect: true,
            password: 'BlueLove',
            isConnected: true,
          )
        ],
      ),
    );
  }

  Future<List> getWifiConnections() async {
    var listAvailableWifi = await WifiConfiguration.getWifiList();
    return listAvailableWifi;
  }
}
