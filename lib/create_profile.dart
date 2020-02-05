import 'package:flutter/material.dart';

class ProfileCreate extends StatefulWidget {
  static String tag = 'create-profile';
  @override
  _ProfileCreate createState() {
    return new _ProfileCreate();
  }
}

class _ProfileCreate extends State<ProfileCreate> {
  final _finalkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create Profile"),
        ),
        body: Form(
            key: _finalkey,
            child: ListView(
              padding: EdgeInsets.all(20),
              children: <Widget>[
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20,left: 20,top: 5,bottom: 5),
                    child: TextFormField(
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                          border: InputBorder.none, /*hintText: "USERNAME",*/helperText: "Username"),
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20,left: 20,top: 5,bottom: 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none, helperText: "Branch"),
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20,left: 20,top: 5,bottom: 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none, helperText: "Roll No."),
                    ),
                  ),
                )
              ],
            )));
  }
}
