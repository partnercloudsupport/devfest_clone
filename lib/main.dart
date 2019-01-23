import 'package:devfest/buy_ticket.dart';
import 'package:devfest/chat/authentication_with_phone.dart';
import 'package:devfest/chat/devfest_login_page.dart';
import 'package:devfest/chat/fireBase/home_page_aut.dart';
//import 'package:devfest/chat/fireBase/devfest_login_page.dart';
import 'package:devfest/chat/fireBase/sign_up_page.dart';
import 'package:devfest/devfest_home_page.dart';
import 'package:devfest/devfest_schedule_page.dart';
import 'package:devfest/speaker/devfest_popup_speaker_page.dart';
import 'package:devfest/speaker/devfest_speakers_page.dart';
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
//      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      routes: <String, WidgetBuilder>{
        "/homepage": (BuildContext context)=> MyHomePage(),
        "/buypage": (BuildContext context)=> BuyTicket(),
        "/popupspeakerpage": (BuildContext context)=> PopupSpeaker(),
        "/speakerpage": (BuildContext context)=> DevFestSpeakerPage(),
        '/landingpage': (BuildContext context)=> MyHomePage(),
        '/home_page_aut': (BuildContext context)=> HomePageAut(),
        '/signup': (BuildContext context) => SignUpPage(),
        '/phonepage': (BuildContext context) => AuthenticationWithPhone()
      },
    );
  }
  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => DevFestLoginPage(),
//      fullscreenDialog: true,
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
            labelColor: Colors.indigo,
            unselectedLabelColor: Colors.indigo,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home),
//                text:  MyString.home,
              ),
              Tab(
                icon: Icon(Icons.schedule),
//                text: MyString.schedule,
              ),
              Tab(
                icon: Icon(Icons.person),
//                text: MyString.speakers,
              ),
              Tab(
                icon: Icon(Icons.chat),
//                text: MyString.chat,
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
//          DevFestChatPage()
          DevFestLoginPage()
        ],
      ),
    );
  }
}
