import 'package:devfest/devfest_chat_page.dart';
import 'package:devfest/devfest_home_page.dart';
import 'package:devfest/devfest_schedule_page.dart';
import 'package:devfest/devfest_speakers_page.dart';
import 'package:flutter/material.dart';

import 'package:devfest/my_string.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevFest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DevFestState createState() => _DevFestState();
}

class _DevFestState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//        centerTitle: true,
//      ),
        bottomNavigationBar: Material(
          color: Colors.white,
          child: TabBar(
            controller: controller,
            labelColor: Color(0xffed5992),
            unselectedLabelColor: Colors.grey,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home),
                text:  MyString.home,
              ),
              Tab(
                icon: Icon(Icons.schedule),
                text: MyString.schedule,
              ),
              Tab(
                icon: Icon(Icons.person),
                text: MyString.speakers,
              ),
              Tab(
                icon: Icon(Icons.chat),
                text: MyString.chat,
              ),
            ],
          ),
        ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          DevFestHomePage(),
          DevFestSchedulePage(),
          DevFestSpeakerPage(),
          DevFestChatPage()
        ],
      ),
    );
  }
}
