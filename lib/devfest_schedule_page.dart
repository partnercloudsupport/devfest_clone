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
        body: _buildBody(context)
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("/speaker").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final speakers = Speaker.fromSnapshot(data);

    return Container(
      height: 300,
      width: 20,
      margin: EdgeInsets.all(10),
      decoration: new BoxDecoration(
        border: new Border.all(width: 3.0, color: Colors.black),
        color: Colors.transparent,
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: _buildPerson(speakers),
      )

    );
  }

  List<Widget> _buildPerson (Speaker str){
    print(str);
    List<Widget> item = [];
//    for(var s in str){
      item.add(
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
             children: <Widget>[
               Row(
                 children: <Widget>[
                   Text("Name ${str.fsname}")
                 ],
               ),
               SizedBox(height: 20,),
               Row(
                 children: <Widget>[
                   Text("Name ${str.city}")
                 ],
               ),
               SizedBox(height: 20,),
               Text(
                 "Description ${str.description}",
                 maxLines: 3,
                 overflow: TextOverflow.ellipsis,
                 style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.bold,
//                        color: Colors.black45
                 ),
               ),
               SizedBox(height: 20,),
               Row(
                 children: _buildSocial(str.social)
               ),

             ],
            )
          )
      );
//    }
    return item;
  }

  List<Widget> _buildSocial(List<String> str){
    List<Widget> item = [];
    for(var s in str){
      item.add(
          Container(
            width: 30,
            height: 30,
            margin: EdgeInsets.only(right: 10),
            child: Image.asset(
              "assets/${s.toString()}.png",
              height: 20.0,
              width: 20.0,
            ),
          )
      );
    }
    return item;
  }
}

class Speaker {
  final String city;
  final String description;
  final String fsname;
  final List<String> social;
  final DocumentReference reference;

  Speaker.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['city'] != null),
        assert(map['description'] != null),
        assert(map['fsname'] != null),
        assert(map['social'] != null),

        city = map['city'],
        description = map['description'],
        fsname = map['fsname'],
        social = List.from(map['social']);

  Speaker.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Speaker<$city:$description:$fsname:$social>";
}

