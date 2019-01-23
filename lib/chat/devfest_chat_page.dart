//import 'package:devfest/chat/fireBase/devfest_login_page.dart';
import 'package:flutter/material.dart';
import 'package:devfest/my_string.dart';

class DevFestChatPage extends StatefulWidget {
  @override
  _DevFestChatPageState createState() => _DevFestChatPageState();
}

class _DevFestChatPageState extends State<DevFestChatPage> {
  @override
  Widget build(BuildContext context) {
//    return LoginPage();
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        centerTitle: true,
      ),
      body:
//      SingleChildScrollView(
//        child:
      Center(
        child: Container(
            padding: EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//                Padding(
//                  padding: EdgeInsets.only(top: 145),
//                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                TextField(
                    decoration: InputDecoration(hintText: 'Email'),
                    autofocus: true,
                    autocorrect: true,
                    obscureText: true, ),
                SizedBox(height: 15.0),
                TextField(
                  decoration: InputDecoration(hintText: 'Password'),
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  child: Text('Login'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 7.0,
                  onPressed: () {
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  child: Text('Login with Phone'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 7.0,
                  onPressed: () {
                  },
                ),
                SizedBox(height: 20,),
                RaisedButton(
                  child: Text('Login with Google'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 7.0,
                  onPressed: () {

                  },
                ),
                SizedBox(height: 15.0),
                Text('Don\'t have an account?'),
                SizedBox(height: 10.0),
                RaisedButton(
                  child: Text('Sign Up'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 7.0,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                ),
              ],
            )
        ),
      ),
//      )
    );
  }
}
