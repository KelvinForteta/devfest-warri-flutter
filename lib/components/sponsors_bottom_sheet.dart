import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devfest_warri/components/sponsors_card.dart';
import 'package:flutter/material.dart';

class SponsorsBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      // color: Colors.red,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: ListView(
        children: <Widget>[
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Meet Our Sponsors',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance
                      .collection('sponsors')
                      .orderBy('id', descending: false)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError)
                      return new Text('Error: ${snapshot.error}');
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      default:
                        return Container(
                          height: 400,
                          child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.documents.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  (MediaQuery.of(context).orientation ==
                                          Orientation.portrait)
                                      ? 2
                                      : 3,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return SponsorsCard(
                                name: snapshot.data.documents[index]['name'],
                                photo: snapshot.data.documents[index]['photo'],
                              );
                            },
                          ),
                        );
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
