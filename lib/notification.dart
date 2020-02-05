import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class Notifications extends StatefulWidget {
  @override
  _Notifications createState() => new _Notifications();
}

class _Notifications extends State<Notifications> {
  int c = 6;
  String str = "visit https://veggiesbasket.com and Hi, I am a very lazy person just wrote this because donno what to write, thank you for reading this and wasting your timeHi, I am a verHi, I am a very lazy person just veggiesbasket.com wrote this because donno what to write, thank you for reading this and wasting your timeHi, I am a very lazy person just wrote this because donno what to write, thank you for reading this and wasting your timeHi, I am a very lazy person just wrote this because donno what to write, thank you for reading this and wasting your timeHi, I am a very lazy person just wrote this because donno what to write, thank you for reading this and wasting your timeHi, I am a very lazy person just wrote this because donno what to write, thank you for reading this and wasting your timeHi, I am a very lazy person just wrote this because donno what to write, thank you for reading this and wasting your timeHi, I am a very lazy person just wrote this because donno what to write, thank you for reading this and wasting your timeHi, I am a very lazy person just wrote this because donno what to write, thank you for reading this and wasting your timeHi, I am a very lazy person just wrote this because donno what to write, thank you for reading this and wasting your timeHi, I am a very laz";
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        forceElevated: true,
        elevation: 8,
        backgroundColor: Colors.white,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(
            " Notifications ",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 23.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          background: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 290,
                child: Image.asset(
                  "assets/alucard.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 70,
                color: Colors.lightBlueAccent,
              )
            ],
          ),
        ),
      ),
      SliverList(
          delegate: SliverChildListDelegate(<Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.amber[100],
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ExpandablePanel(
                theme: ExpandableThemeData(useInkWell: true),
                tapBodyToCollapse: true,
                header: Text(
                  "bvrit information about you",
                  style: TextStyle(fontSize: 20),
                ),
                collapsed: Linkify(
                  onOpen: (link) async {
                    if (await canLaunch(link.url)) {
                      await launch(link.url);
                    } else {
                      throw 'sorry';
                    }
                  },
                  text:
                      str,
                  style: TextStyle(color: Colors.black),
                  linkStyle: TextStyle(color: Colors.blue),
                  options: LinkifyOptions(humanize: false),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                expanded: Linkify(
                  onOpen: (link) async {
                    if (await canLaunch(link.url)) {
                      await launch(link.url);
                    } else {
                      throw 'sorry';
                    }
                  },
                  text:
                      str,
                  style: TextStyle(color: Colors.black),
                  linkStyle: TextStyle(color: Colors.blue),
                  options: LinkifyOptions(humanize: false),
                  overflow: TextOverflow.visible,
                  
                ),
                tapHeaderToExpand: true,
                hasIcon: true,
              ),
            ),
          ),
        ),
        
      ]))
    ]);
  }
}