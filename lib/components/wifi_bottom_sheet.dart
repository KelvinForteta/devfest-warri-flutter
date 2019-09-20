import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devfest_warri/resources/firebase_repository.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class WifiBottomSheet extends StatelessWidget {
  final scaffold;
  WifiBottomSheet({this.scaffold});
  @override
  Widget build(BuildContext context) {
    FirebaseRepository _repository = FirebaseRepository();
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
          stream: _repository.getWifiDetails(),
          builder:
              (BuildContext context2, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              default:
                return new ListView(
                  children:
                      snapshot.data.documents.map((DocumentSnapshot document) {
                    return Card(
                      elevation: 5,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Network SSID: '),
                                  Text(
                                    document['network_ssid'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                      icon: Icon(Icons.content_copy),
                                      onPressed: () {
                                        ClipboardManager.copyToClipBoard(
                                                document['network_ssid'])
                                            .then((result) {
                                          Toast.show(
                                              "Copied to clipboard", context,
                                              duration: Toast.LENGTH_SHORT,
                                              gravity: Toast.CENTER);
                                        });
                                      }),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text('Password: '),
                                  Text(
                                    document['password'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                      icon: Icon(Icons.content_copy),
                                      onPressed: null),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
            }
          },
        ));
  }
}
