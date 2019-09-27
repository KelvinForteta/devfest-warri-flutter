import 'package:flutter/material.dart';

class AvailableWifi extends StatelessWidget {
  final String name;
  final String password;
  // final String buttonText;
  final Function onPressed;
  final bool isConnected;
  final bool isConnecting;

  AvailableWifi({
    @required this.name,
    this.password,
    //   @required this.buttonText,
    this.onPressed,
    this.isConnected = false,
    this.isConnecting = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          subtitle: Row(children: <Widget>[
            Icon(
              Icons.lock_outline,
              size: 20,
            ),
            SizedBox(
              width: 4,
            ),
            Text(password)
          ]),
          leading: CircleAvatar(
            backgroundColor: isConnected ? Colors.green : Colors.blue,
            child: Icon(
              Icons.wifi,
              color: Colors.white,
            ),
          ),
          title: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          trailing: isConnecting
              ? SizedBox(
                  child: CircularProgressIndicator(),
                  height: 26,
                  width: 26,
                )
              : FlatButton(
                  onPressed: onPressed,
                  child: isConnected
                      ? Text(
                          'Connected',
                          style: TextStyle(color: Colors.white),
                        )
                      : Text(
                          'Connect',
                          style: TextStyle(color: Colors.white),
                        ),
                  color: isConnected ? Colors.green : Colors.blue,
                ),
        ),
      ),
    );
  }
}
