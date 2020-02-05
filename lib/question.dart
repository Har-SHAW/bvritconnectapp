import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  @override
  _Questions createState() => new _Questions();
}

class _Questions extends State<Questions> {
  int c = 6;
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
            " Ask it! ",
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
        Container(
          color: Colors.pinkAccent,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        )
      ]))
    ]);
  }
}
