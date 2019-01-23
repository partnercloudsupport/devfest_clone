import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePageAut extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageAut> {
  String uid = "";

  getUid(){

  }

  @override
  void initState() {
    this.uid = "";
    FirebaseAuth.instance.currentUser().then((value){
      setState(() {
        this.uid = value.uid;
      });
    }).catchError((e){
      print(e);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DashBoard"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("You are now logged in as ${this.uid} "),
              SizedBox(height: 15,),
              OutlineButton(
                borderSide: BorderSide(
                  color: Colors.indigo,
                  style: BorderStyle.solid,
                  width: 4,
                ),
                child: Text("Logout"),
                onPressed: (){
                  FirebaseAuth.instance.signOut().then((action){
                    Navigator.of(context).pushReplacementNamed("/homepage");
                  }).catchError((e){
                    print(e);
                  });
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
