import 'package:bvrit/feed.dart';
import 'package:bvrit/notification.dart';
import 'package:bvrit/profile.dart';
import 'package:bvrit/question.dart';
import 'package:bvrit/settings.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//final xstorage = new FlutterSecureStorage();

class HomePage extends StatefulWidget {
  static String tag = 'home-page';
  @override
  _HomePage createState() {
    return new _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  _HomePage() {
    /* readToken().then((onValue) => setState(() {
          token1 = onValue;
        }));*/
  }
  int c = 6;
  int selectedIndex = 0;
/*
  String token1;

  Future<String> readToken() async {
    final token = await xstorage.read(key: 'accessToken');
    return token;
  }*/
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: TabBarView(
            children: <Widget>[
              Feed(),
              Notifications(),
              Settings(),
              Profile(),
              Questions()
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: new TabBar(
            tabs: [
              Tab(
                icon: new Icon(
                  Icons.home,
                  size: 30,
                ),
              ),
              Tab(
                icon: new Icon(
                  Icons.notifications,
                  size: 30,
                ),
              ),
              Tab(
                icon: new Icon(
                  Icons.settings,
                  size: 30,
                ),
              ),
              Tab(
                icon: new Icon(
                  Icons.person,
                  size: 30,
                ),
              ),
              Tab(
                icon: new Icon(
                  Icons.question_answer,
                  size: 30,
                ),
              ),
            ],
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.red,
          ),
        ),
      ),
    );
  }
}
