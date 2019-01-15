import 'package:flutter/material.dart';
import 'dart:ui';

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
            leading: Icon(Icons.home),
            centerTitle: true,
            pinned: true,// что бы появлялся бар
            title: Text("DevFest"),
            floating: true,//что бы при скроле проподал текст
            expandedHeight: 550,
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 160,
                    height: 280,
//                  decoration: BoxDecoration(
//                    color: Colors.amber
//                  ),
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
                            onPressed: (){},
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
          SliverFixedExtentList(
            itemExtent: 150.0,
            delegate: SliverChildListDelegate(
              [
                Container(color: Colors.blue, height: 150.0),
                Container(color: Colors.grey, height: 150.0),
                Container(color: Colors.green, height: 150.0),
                Container(color: Colors.red, height: 150.0),

                Container(color: Colors.green, height: 150.0),
                _buildContent(),
                Container(color: Colors.blue, height: 150.0),
                Container(color: Colors.grey, height: 150.0),
                Container(color: Colors.green, height: 150.0),
                Container(color: Colors.red, height: 150.0),

                Container(color: Colors.green, height: 150.0),
                _buildContent(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContent(){
    return  Container(
      height: 500,
      color: Colors.grey,
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Row(children: <Widget>[Center(child: Text("adf 1",style: TextStyle(fontSize: 24),),)],),
          Row(children: <Widget>[Center(child: Text("adf 1fdsa",style: TextStyle(fontSize: 24),),)],),
          Row(children: <Widget>[Center(child: Text("adf 12431",style: TextStyle(fontSize: 24),),)],),
          Row(children: <Widget>[Center(child: Text("adf 2131",style: TextStyle(fontSize: 24),),)],),
          Row(children: <Widget>[Center(child: Text("adf 1afds",style: TextStyle(fontSize: 24),),)],),
          Row(children: <Widget>[Center(child: Text("adf 11243",style: TextStyle(fontSize: 24),),)],),
        ],
      ),
    );
  }

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
}
