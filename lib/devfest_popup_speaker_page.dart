import 'package:flutter/material.dart';

class PopupSpeaker extends StatefulWidget {
  @override
  _PopupSpeakerState createState() => _PopupSpeakerState();
}

class _PopupSpeakerState extends State<PopupSpeaker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popup Speaker"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).pushReplacementNamed("/speakerpage");
          },
        ),
      ),
      body: Center(
        child: Container(
          child: Text("popup info"),
        ),
      ),
    );
  }
}