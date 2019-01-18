import 'package:devfest/devfest_popup_speaker_page.dart';
import 'package:flutter/material.dart';
import 'package:devfest/my_string.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
//icons provider
import 'package:flutter_svg/flutter_svg.dart';

class DevFestSpeakerPage extends StatefulWidget {
  @override
  _DevFestSpeakerPageState createState() => _DevFestSpeakerPageState();
}

class _DevFestSpeakerPageState extends State<DevFestSpeakerPage> {
  var personIcon = ["twitter","google", "facebook", "skype"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Speakers"),
        centerTitle: true,
      ),
      body:  _buildBody()
    );
  }

  Widget _buildBody() {
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

    return Card(
      margin: EdgeInsets.fromLTRB(15,5,15,5),
      clipBehavior: Clip.antiAlias,
      elevation: 8,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => PopupSpeaker()));
        },
        child: Column(
          children: _buildPerson(speakers),
        )
      )
    );
  }

  List<Widget> _buildPerson (Speaker str){
    print(str);
    List<Widget> item = [];
    item.add(
       Container(
        color: Colors.white,
        height: 480,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                width: 175,
                height: 175,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
//                      todo add image person (face :) )
                        image: AssetImage("assets/fon_main.png"),
                        fit: BoxFit.fill
                    )
                ),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: Container(
//                      todo add image company
                child: Center(child: Text("Company")),
                width: 100,
                height: 20,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: Text(
                str.fsname,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: Text(
                str.city,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  str.description,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Center(
              //add social icons
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children:  _buildSocial(str.social)
              ),
            )
          ],
        ),
      ),
    );
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
            color: Colors.indigo,
          ),
        )
      );
    }
    return item;
  }

}

/// info speaker

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