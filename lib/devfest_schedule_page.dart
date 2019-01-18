import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:devfest/my_string.dart';

class DevFestSchedulePage extends StatefulWidget {
  @override
  _DevFestSchedulePageState createState() => _DevFestSchedulePageState();
}

class _DevFestSchedulePageState extends State<DevFestSchedulePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Schedule"),
        ),
        body: Center(
          child: Text("Schedule todo ........."),
        )
    );
  }


}

//class Speaker {
//  final String city;
//  final String description;
//  final String fsname;
//  final List<String> social;
//  final DocumentReference reference;
//
//  Speaker.fromMap(Map<String, dynamic> map, {this.reference})
//      : assert(map['city'] != null),
//        assert(map['description'] != null),
//        assert(map['fsname'] != null),
//        assert(map['social'] != null),
//
//        city = map['city'],
//        description = map['description'],
//        fsname = map['fsname'],
//        social = List.from(map['social']);
//
//  Speaker.fromSnapshot(DocumentSnapshot snapshot)
//      : this.fromMap(snapshot.data, reference: snapshot.reference);
//
//  @override
//  String toString() => "Speaker<$city:$description:$fsname:$social>";
//}
//
