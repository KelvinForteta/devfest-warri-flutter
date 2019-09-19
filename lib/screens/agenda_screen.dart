import 'package:flutter/material.dart';

class AgendaScreen extends StatelessWidget {
  static const ID = 'agenda_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Agenda'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Agenda Page'),
      ),
    );
  }
}
