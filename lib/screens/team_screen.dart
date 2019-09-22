import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devfest_warri/components/speakers_card.dart';
import 'package:flutter/material.dart';

class TeamScreen extends StatelessWidget {
  static const ID = 'team_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Meet The Team'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('speakers')
            .where("type", isEqualTo: "team")
            .orderBy('id', descending: false)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                  return SpeakersCard(
                    name: document['name'],
                    photo: document['photo'],
                    position: document['position'],
                    location: document['location'],
                    facebook: document['facebook'],
                    twitter: document['twitter'],
                    github: document['github'],
                    linkedIn: document['linkedin'],
                    web: document['web'],
                    email: document['email'],
                    speakOn: document['speaking_on'],
                  );
                }).toList(),
              );
          }
        },
      ),
    );
  }
}
