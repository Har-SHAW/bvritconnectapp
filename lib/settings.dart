import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _Settings createState() => new _Settings();
}

class _Settings extends State<Settings> {
  int c = 6;

  String dfeed = "CSE";
  String dnotifications = "CSE";
  List<String> feed = [];
  List<String> notifications = [];
  @override
  void initState() {
    feed.add(dfeed);
    notifications.add(dnotifications);
    super.initState();
  }

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
            " Settings ",
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
                header: Text(
                  "Recieve Feed From?",
                  style: TextStyle(fontSize: 20),
                ),
                collapsed: Text(feed.join(", ")),
                expanded: _feedbuttons(),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.purple[100],
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ExpandablePanel(
                header: Text(
                  "Recieve Notifications From?",
                  style: TextStyle(fontSize: 20),
                ),
                collapsed: Text(notifications.join(", ")),
                expanded: _notificationsbuttons(),
                tapHeaderToExpand: true,
                hasIcon: true,
              ),
            ),
          ),
        ),
      ]))
    ]);
  }

  Widget _feedbuttons() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Checkbox(
                value: feed.contains("CSE"),
                onChanged: (value) {
                  setState(() {
                    if (dfeed == "CSE" ? !value:value == true) {
                      if(!feed.contains("CSE")){
                        feed.add("CSE");
                      }
                    } else {
                      feed.remove("CSE");
                    }
                  });
                },
              ),
              Text("CSE")
            ],
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: feed.contains("EEE"),
                onChanged: (value) {
                  setState(() {
                    if (dfeed == "EEE" ? !value:value == true) {
                      if(!feed.contains("EEE")){
                        feed.add("EEE");
                      }
                    } else {
                      feed.remove("EEE");
                    }
                  });
                },
              ),
              Text("EEE")
            ],
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: feed.contains("ECE"),
                onChanged: (value) {
                  setState(() {
                    if (dfeed == "ECE" ? !value:value == true) {
                      if(!feed.contains("ECE")){
                        feed.add("ECE");
                      }
                    } else {
                      feed.remove("ECE");
                    }
                  });
                },
              ),
              Text("ECE")
            ],
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: feed.contains("MEC"),
                onChanged: (value) {
                  setState(() {
                    if (dfeed == "MEC" ? !value:value == true) {
                      if(!feed.contains("MEC")){
                        feed.add("MEC");
                      }
                    } else {
                      feed.remove("MEC");
                    }
                  });
                },
              ),
              Text("MEC")
            ],
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: feed.contains("BME"),
                onChanged: (value) {
                  setState(() {
                    if (dfeed == "BME" ? !value:value == true) {
                      if(!feed.contains("BME")){
                        feed.add("BME");
                      }
                      
                    } else {
                      feed.remove("BME");
                    }
                  });
                },
              ),
              Text("BME")
            ],
          ),
        ],
      );

  Widget _notificationsbuttons() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Checkbox(
                value: notifications.contains("CSE"),
                onChanged: (value) {
                  setState(() {
                    if (dnotifications == "CSE" ? !value:value == true) {
                      if(!notifications.contains("CSE")){
                        notifications.add("CSE");
                      }
                    } else {
                      notifications.remove("CSE");
                    }
                  });
                },
              ),
              Text("CSE")
            ],
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: notifications.contains("EEE"),
                onChanged: (value) {
                  setState(() {
                    if (dnotifications == "EEE" ? !value:value == true) {
                      if(!notifications.contains("EEE")){
                        notifications.add("EEE");
                      }
                    } else {
                      notifications.remove("EEE");
                    }
                  });
                },
              ),
              Text("EEE")
            ],
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: notifications.contains("ECE"),
                onChanged: (value) {
                  setState(() {
                    if (dnotifications == "ECE" ? !value:value == true) {
                      if(!notifications.contains("ECE")){
                        notifications.add("ECE");
                      }
                    } else {
                      notifications.remove("ECE");
                    }
                  });
                },
              ),
              Text("ECE")
            ],
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: notifications.contains("MEC"),
                onChanged: (value) {
                  setState(() {
                    if (dnotifications == "MEC" ? !value:value == true) {
                      if(!notifications.contains("MEC")){
                        notifications.add("MEC");
                      }
                    } else {
                      notifications.remove("MEC");
                    }
                  });
                },
              ),
              Text("MEC")
            ],
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: notifications.contains("BME"),
                onChanged: (value) {
                  setState(() {
                    if (dnotifications == "BME" ? !value:value == true) {
                      if(!notifications.contains("BME")){
                        notifications.add("BME");
                      }
                    } else {
                      notifications.remove("BME");
                    }
                  });
                },
              ),
              Text("BME")
            ],
          ),
        ],
      );
}
