import 'package:devfest/buy_ticket.dart';

import 'package:flutter/material.dart';
import 'dart:ui';
//  open url
import 'package:url_launcher/url_launcher.dart';

class DevFestHomePage extends StatefulWidget {
  @override
  _DevFestHomePageState createState() => _DevFestHomePageState();
}

class _DevFestHomePageState extends State<DevFestHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
//            leading: Icon(Icons.home),
            centerTitle: true,
            pinned: false,// что бы появлялся бар
            title: Text("DevFest"),
//            floating: true,//что бы при скроле проподал текст
            expandedHeight: 550,
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 160,
                    height: 280,
                    child: Column(
                      children: <Widget>[
                        _buildRow("GDG DevFest",24),
                        _buildRow("Gorky 2019",24),
                        SizedBox(height: 10,),
                        _buildRow("Nizhny Novgorod.",18),
                        _buildRow("October 27, 2018",18),
                        SizedBox(height: 10,),
                        _buildRow("Be a hero. Be a GDG!",16),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: RaisedButton(
                            child: Container(
                              width: 95,
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.shopping_cart,color: Colors.white,),
                                  SizedBox(width: 4,),
                                  Text("Buy Ticket",style: TextStyle(color: Colors.white),),
                                ],
                              ),
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => BuyTicket()));
                            },
                            color: Colors.indigo,
                            elevation: 8,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/fon_main.png"),fit: BoxFit.cover),
                  color: Colors.grey.shade200.withOpacity(0.5)
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                  child: Container(
                  decoration: BoxDecoration(color: Colors.black26.withOpacity(0.25)),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
//                content
                _buildContent(),
                _buildTickets(),
              ],
            ),
          )
        ],
      ),
    );
  }

  //        method

  _buildRow(String str,double size){
    return Row(
      children: <Widget>[
        Text(
          str,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size,
              color: Colors.white
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildItem(String str,String str2, double size,double size2,Color color){
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Text(str,style: TextStyle(fontSize: size,color: color,fontWeight: FontWeight.bold),),
          Text(str2,style: TextStyle(fontSize: size2,color: color),),
        ],
      ),
      width: 160,
    );
  }

  Widget _buildContent(){
      return  Column(
        children: <Widget>[
          Container(
            height: 530,
            color: Colors.grey[400],
            padding: EdgeInsets.only(top: 40,bottom: 40,left: 20,right: 20),
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    "What you need to know, before you ask.",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "What is DevFest? Google Developer Group DevFests are the largest Google related events in the world! Each DevFest is carefully crafted for you by your local GDG community to bring in awesome speakers from all over the world, great topics, and lots fun!",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54
                  ),
                  overflow: TextOverflow.clip,
                ),
                SizedBox(height: 20,),
                Center(
                  child: RaisedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Explore featured session at the devFest",style: TextStyle(
                          fontSize: 14.5
                        ),),
                        Icon(Icons.arrow_forward_ios,size: 16,),
                      ],
                    ),
                    color: Colors.indigo,
                    textColor: Colors.white,
                    elevation: 7,
                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
                    onPressed: (){
//                      Uri.encodeComponent("https://www.youtube.com/channel/UCEGCwbU4OOpCZ38AA0coADA");
//  todo create link https://www.youtube.com/channel/UCEGCwbU4OOpCZ38AA0coADA
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        _buildItem("500","Attendees",28,24,Colors.black),
                        _buildItem("1","Day",28,24,Colors.black),
                      ]
                    ),
                    SizedBox(height: 50,),
                    Row(
                      children: <Widget>[
                        _buildItem("16","Sessions",28,24,Colors.black),
                        _buildItem("2","Tracks",28,24,Colors.black),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
//
          Container(
            color: Colors.indigo,
            padding: EdgeInsets.all(20),
            height: 210,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                Text(
                  "Get notified about the important conference updates",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                  overflow: TextOverflow.clip,
                ),
                SizedBox(height: 20,),
                Center(
                  child: RaisedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Subscribe",style: TextStyle(
                            fontSize: 18
                        ),),
                        Icon(Icons.arrow_forward_ios,size: 18,),
                      ],
                    ),
//                    color: Colors.deepPurple,
                    textColor: Colors.black,
                    elevation: 7,
                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
                    onPressed: (){
//  todo subscrib
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      );
  }

  Widget _buildTickets(){
    return Container(
      padding: EdgeInsets.all(20),
      width: 400,
      color: Colors.grey[400],
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              "Tickets",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            height: 420,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildTicketItem("Student","P500","Jun 17 - Oct 26",
                  true,0,
                  "Valid student ID"),
                _buildTicketItem("Pre-Early Bird","P500,","Jun 17 - Oct 26",
                  false,43,),
                _buildTicketItem("Early Bird","P750","Jun 17 - Oct 26",
                  true,2,
                  "Cool"),
                _buildTicketItem("Regular","P1000","Jun 17 - Oct 26",
                  true,14,),
                _buildTicketItem("Last Chance","P1500","Jun 17 - Oct 26",
                  false,41,
                  "Last Chance by tikets"),

              ],
            ),
          )
        ],
      ),
    );
  }
//  content by tickets
  Widget _buildTicketItem(String head,String price,String date,
      bool check,
      int tickets,
      [String other]
      ){
    return Container(
      margin: EdgeInsets.all(5),
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white70,
        border: Border.all(
          width: 3.0,
          color: Colors.indigo
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(5.0)
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Center(
            child: Text(
              head,
              style: TextStyle(
                fontSize: 30,
                color: Colors.black87
              ),
            ),
          ),
          SizedBox(height: 40,),
          Center(
            child: Text(
              price,
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.black87
              ),
            ),
          ),
          SizedBox(height: 20,),
          Center(
            child: Text(
              date,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87
              ),
            ),
          ),
          SizedBox(height: 10,),
//        span text under date
          Text(
              other ?? "",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                  color: Colors.black87
              )
          ),
          SizedBox(height: 40,),
          _checkTicket(tickets),
          SizedBox(height: 30,),
        ],
      ),
    );
  }
//  // span text date
//  Widget span(String spanT){
//    return Column(
//      children: <Widget>[
//        SizedBox(height: 40,),
//        Text(
//          spanT,
//          style: TextStyle(
//          fontSize: 20,
//          fontWeight: FontWeight.w200,
//          color: Colors.black87
//          )
//        ),
//      ],
//    );
//  }
//  have or not tickets
  Widget _checkTicket(int tickets){
//    by tickets
//    span(spanT);
    if(tickets > 0 ){
      return Column(
        children: <Widget>[
          SizedBox(height: 10,),
          Text(
            "Tikets = $tickets",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),
          SizedBox(height: 30,),
          OutlineButton(
            borderSide: BorderSide(
              color: Colors.indigo,
              width: 3,
            ),
            color: Colors.black,
            child: Text("Buy Tiket",style: TextStyle(fontSize: 26),),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BuyTicket()));
            },
          ),
        ],
      );
    }
//    no have tickets
    else
      return Column(
        children: <Widget>[
          SizedBox(height: 70,),
          Text(
            "you missed it".toUpperCase(),
            style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),
        ],
      );
  }
//


// dialog


// open url
  _launchURL(String  urlYou) async {
    final url = urlYou;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
