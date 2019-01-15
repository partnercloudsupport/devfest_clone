import 'package:flutter/material.dart';

class BuyTicket extends StatefulWidget {
  @override
  _BuyTicketState createState() => _BuyTicketState();
}

class _BuyTicketState extends State<BuyTicket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buy Ticket"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text("Buy"),
          )
        ],
      ),
    );
  }
}
