import 'package:flutter/material.dart';

class AvailableWifi extends StatelessWidget {
  final String name;
  final String password;
  final String buttonText;
  final bool canConnect;
  final Function onPressed;
  final bool isConnected;
  final bool isConnecting;

  AvailableWifi({
    @required this.name,
    this.password,
    @required this.buttonText,
    this.canConnect = false,
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
          subtitle: canConnect
              ? Row(children: <Widget>[
                  Icon(
                    Icons.lock_outline,
                    size: 20,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(password)
                ])
              : null,
          leading: CircleAvatar(
            backgroundColor: isConnected
                ? Colors.green
                : canConnect ? Colors.blue : Colors.grey,
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
                  child: Text(
                    buttonText,
                    style: TextStyle(color: Colors.white),
                  ),
                  color: isConnected
                      ? Colors.green
                      : canConnect ? Colors.blue : Colors.grey,
                ),
        ),
      ),
    );
  }
}
