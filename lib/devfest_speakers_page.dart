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

  List<Card> allCard = [];


  Widget loadData(){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("speaker").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
          return Center(child: Text("Good"));

//        return _buildList(context, snapshot.data.documents);
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Speakers"),
          centerTitle: true,
        ),
        body: loadData()
//        StreamBuilder(
//          builder: (BuildContext context,snapshot){
//            return
//          },
//        )
//        ListView(
//            padding: EdgeInsets.all(16.0),
//            children:  _buildGridCards(10)
//        ),
    );
  }


  List<Card> _buildGridCards(int count) {
    List<Card> cards = List.generate(
      count,
          (int index) =>
          Card(
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.only(top: 5),
            elevation: 8,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PopupSpeaker()));
              },
              child: Container(
                color: Colors.white,
                height: 430,
//            width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: 175,
                        height: 175,
//                  padding: EdgeInsets.only(top: 10),
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("assets/fon_main.png"),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Center(
                      child: Container(
                        child: Center(child: Text("Company")),
                        width: 100,
                        height: 20,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Center(
                      child: Text(
                        "Name Name",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Center(
                      child: Text(
                        "Ukraine, Donneck",
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
                          ""
                            "Some text Some text Some text Some text Some text"
                            " Some text Some text Some text Some text Some text"
                            " Some text Some text Some text Some text Some text"
                            " Some text Some text Some text Some text Some text"
                            " Some text Some text Some text Some text Some text"
                            " Some text Some text Some text Some text Some text"
                            " Some text Some text Some text Some text Some text"
                          "",
                          maxLines: 3,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
//                        color: Colors.black45
                          ),
                        ),
                      ),
                    ),
                    Center(
                      //add social icons
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  _buildSocialIcon(personIcon)
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
    );

    return cards;
  }

  List<Widget> _buildSocialIcon(List<String> str){
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
