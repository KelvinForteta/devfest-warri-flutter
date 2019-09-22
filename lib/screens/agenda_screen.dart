import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devfest_warri/resources/firebase_repository.dart';
import 'package:flutter/material.dart';

class AgendaScreen extends StatelessWidget {
  static const ID = 'agenda_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Agenda'),
        centerTitle: true,
      ),
      body: Agenda(),
    );
  }
}

class Agenda extends StatelessWidget {
  final FirebaseRepository _firebaseRepository = FirebaseRepository();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firebaseRepository.getAgenda(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          default:
            return ListView(
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                return AgendaCard(
                  title: document['title'],
                  aboutSpeaker: document['about_speaker'],
                  photo: document['photo'],
                  speaker: document['speaker'],
                  time: document['time'],
                  totalTalkTime: document['total_talk_time'],
                );
              }).toList(),
            );
        }
      },
    );
  }
}

class AgendaCard extends StatelessWidget {
  final String title;
  final String speaker;
  final String aboutSpeaker;
  final String photo;
  final String totalTalkTime;
  final String time;

  AgendaCard(
      {this.title,
      this.speaker,
      this.aboutSpeaker,
      this.photo,
      this.totalTalkTime,
      this.time});
  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      margin: EdgeInsets.only(top: 5, bottom: 10, left: 7, right: 7),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: ListTile(
            title: Text(
              '$title',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$speaker',
                  style: TextStyle(color: Colors.blue, fontSize: 17),
                ),
                Text(
                  '$aboutSpeaker',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$totalTalkTime',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
                Text(
                  time,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                )
              ],
            ),
            leading: photo.isNotEmpty
                ? CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage('$photo'),
                  )
                : CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.blue,
                    child: Text(
                      '${speaker.substring(0, 1)}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
      ),
    );
  }
}
