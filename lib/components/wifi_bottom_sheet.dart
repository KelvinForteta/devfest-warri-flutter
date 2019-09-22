import 'package:devfest_warri/components/available_wifi.dart';
import 'package:flutter/material.dart';
import 'package:wifi/wifi.dart';

class WifiBottomSheet extends StatelessWidget {
  // FirebaseRepository _repository = FirebaseRepository();
  Future<List> getWifiConnections() async {
    List<WifiResult> list = await Wifi.list('');
    return list;
  }

  @override
  Widget build(BuildContext context) {
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
        child: FutureBuilder(
          builder: (context, projectSnap) {
            if (projectSnap.connectionState == ConnectionState.none &&
                projectSnap.hasData == null) {
              return Center(
                child: Text('No WiFi Connection found.'),
              );
            }
            if (projectSnap.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: projectSnap.data[0].length,
              itemBuilder: (context, index) {
                return AvailableWifi(
                  name: projectSnap.data[0][index].ssid,
                  buttonText: 'Connect',
                  canConnect: true,
                  password: 'bluelove',
                  // isConnected: true,
                  onPressed: () {
                    connectToWifi(projectSnap.data[0][index].ssid, 'fupre123');
                  },
                );
              },
            );
          },
          future: Future.wait([
            getWifiConnections(),
            // getWifiDetails(),
          ]),
        ));
  }

  connectToWifi(String ssid, String password) async {
    var result = await Wifi.connection(ssid, password);
    print(result);
    return result;
  }

  Future<bool> isConnected(String connectedSsid) async {
    String ssid = await Wifi.ssid;
    print(ssid);
    if (ssid == connectedSsid) {
      return true;
    } else {
      return false;
    }
  }
}
