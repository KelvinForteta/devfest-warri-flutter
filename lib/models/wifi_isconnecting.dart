import 'package:flutter/cupertino.dart';

class IsConnecting extends ChangeNotifier {
  bool isConnecting;

  IsConnecting({this.isConnecting = false});

  changeConnection(bool connectStatus) {
    isConnecting = connectStatus;
    notifyListeners();
  }
}
