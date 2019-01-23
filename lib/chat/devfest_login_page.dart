import 'package:devfest/chat/authentication_with_phone.dart';
import 'package:devfest/chat/devfest_chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Google provider
import 'package:google_sign_in/google_sign_in.dart';

// Facebook provider
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';

// Twitter provider
//import 'package:flutter_twitter_login/flutter_twitter_login.dart';


class DevFestLoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<DevFestLoginPage> {
  String _email;
  String _password;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

//  google sing in
  GoogleSignIn googleAuth = GoogleSignIn();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("Chat"),
//        centerTitle: true,
//      ),
      body: SingleChildScrollView(
        child:
        Center(
          child: Container(
            padding: EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 145),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  controller: _emailController,
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
//                  obscureText: true,
                ),
                SizedBox(height: 15.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  controller: _passwordController,
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  child: Text('Login'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 7.0,
                  onPressed: () {
                    FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                      email: _email, password: _password)
                      .then((FirebaseUser user) {
                      Navigator.of(context).pushReplacementNamed('/home_page_aut');
                    }).catchError((e) {
                      print(e);
                    });
                  },
                ),
                SizedBox(height: 20.0),
                 RaisedButton(
                   child: Text('Chat'),
                   color: Colors.blue,
                   textColor: Colors.white,
                   elevation: 7.0,
                   onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => DevFestChatPage()));
                   },
                 ),
                 SizedBox(height: 20.0),
                RaisedButton(
                  child: Text('Login with Phone'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 7.0,
                  onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AuthenticationWithPhone()));
                  },
                ),
                SizedBox(height: 20,),
                RaisedButton(
                  child: Text('Login with Google'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 7.0,
                  onPressed: () {
                    googleAuth.signIn().then((result){
                      result.authentication.then((googleKey){
                        FirebaseAuth.instance
                            .signInWithGoogle(
                            idToken: googleKey.idToken,
                            accessToken: googleKey.accessToken)
                            .then((signedInUser){
                              print("Sing in as ${signedInUser.displayName}");
                              Navigator.of(context).pushReplacementNamed("/home_page_aut");
                            })
                            .catchError((e){
                          print(e);
                        });
                      }).catchError((e){
                        print(e);
                      });
                    }).catchError((e){
                      print(e);
                    });
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
      )
    );
  }
}
