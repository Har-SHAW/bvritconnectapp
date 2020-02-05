import 'package:bvrit/create_profile.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  @override
  _Profile createState() => new _Profile();
}

class _Profile extends State<Profile> {
  bool show = false;
  final String _fullName = "Harsha Vardhan";
  final String _status = "Btech 3rd Year";
  final String _bio =
      "\"Hi, I am a very lazy person just wrote this because donno what to write, thank you for reading this and wasting your time\"";
  final String bio1 =
      "Hi, I am a very lazy person just wrote this because donno what to write, thank you for reading this and wasting your timeHi, I am a very lazy person just wrote this because donno what to write, thank you for reading this and wasting your timeHi, I am a very lazy person just wrote this because donno what to write, thank you for reading this and wasting your timeHi, I am a very lazy person just wrote this because donno what to write, thank you for reading this and wasting your time";
  final String _followers = "173";
  final String _posts = "24";
  final String _scores = "450";
  int c = 3;

  Widget _buildCoverImage(Size screenSize) {
    return Container(
      height: screenSize.height / 3.6,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/alucard.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Container(
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/alucard.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(80.0),
          border: Border.all(
            color: Colors.white,
            width: 10.0,
          ),
        ),
      ),
    );
  }

  Widget _buildFullName() {
    TextStyle _nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
    );

    return Text(
      _fullName,
      style: _nameTextStyle,
    );
  }

  Widget _buildStatus(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        _status,
        style: TextStyle(
          fontFamily: 'Spectral',
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String count) {
    TextStyle _statLabelTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w200,
    );

    TextStyle _statCountTextStyle = TextStyle(
      color: Colors.black54,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count,
          style: _statCountTextStyle,
        ),
        Text(
          label,
          style: _statLabelTextStyle,
        ),
      ],
    );
  }

  Widget _buildStatContainer() {
    return Container(
      height: 60.0,
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFEFF4F7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildStatItem("Total Likes", _followers),
          _buildStatItem("Posts", _posts),
          //_buildStatItem("Scores", _scores),
        ],
      ),
    );
  }

  Widget _buildBio(BuildContext context) {
    TextStyle bioTextStyle = TextStyle(
      fontFamily: 'Spectral',
      fontWeight: FontWeight.w500, //try changing weight to w500 if not thin
      fontStyle: FontStyle.italic,
      color: Color(0xFF799497),
      fontSize: 16.0,
    );

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.all(8.0),
      child: Text(
        _bio,
        textAlign: TextAlign.center,
        style: bioTextStyle,
      ),
    );
  }

  Widget _buildSeparator(Size screenSize) {
    return Container(
      width: screenSize.width / 1.6,
      height: 2.0,
      color: Colors.black54,
      margin: EdgeInsets.only(top: 4.0),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileCreate()));
              },
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Color(0xFF404A5C),
                ),
                child: Center(
                  child: Text("Create Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  show = !show;
                });
              },
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Color(0xFF404A5C),
                ),
                child: Center(
                  child: Text(
                    show ? "Show less Information" : "Show more Information",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
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
            " Profile ",
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
        Stack(
          children: <Widget>[
            _buildCoverImage(screenSize),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: screenSize.height / 6.4),
                    _buildProfileImage(),
                    _buildFullName(),
                    _buildStatus(context),
                    _buildStatContainer(),
                    _buildBio(context),
                    _buildSeparator(screenSize),
                    SizedBox(height: 10.0),
                    _buildButtons(),
                  ],
                ),
              ),
            ),
          ],
        ),
        show
            ? Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Expanded(
                                child: Text(
                              "Name: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                            /*width: MediaQuery.of(context).size.width*0.25,*/
                          ),
                          Container(
                              child: Expanded(child: Text("Harsha Vardhan")))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Expanded(
                                child: Text(
                              "Roll Number: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                            /*width: MediaQuery.of(context).size.width*0.25,*/
                          ),
                          Container(child: Expanded(child: Text("17211A0573")))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Expanded(
                                child: Text(
                              "Email: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                            /*width: MediaQuery.of(context).size.width*0.25,*/
                          ),
                          Container(
                              child: Expanded(
                                  child: Text("8888harsha4444@gmail.com")))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Expanded(
                                child: Text(
                              "Branch: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                            /*width: MediaQuery.of(context).size.width*0.25,*/
                          ),
                          Container(
                              child: Expanded(
                                  child:
                                      Text("Computer Science and Engineering")))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Expanded(
                                child: Text(
                              "Date of Birth: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                            /*width: MediaQuery.of(context).size.width*0.25,*/
                          ),
                          Container(child: Expanded(child: Text("07/06/1999")))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Expanded(
                                child: Text(
                              "Skill set: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                            /*width: MediaQuery.of(context).size.width*0.25,*/
                          ),
                          Container(
                              child: Expanded(
                                  child: Text(
                                      "JAVA, Python, C, C++, Dart, Python with oops, JavaScript, HTML, CSS")))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Expanded(
                                child: Text(
                              "Softwares: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                            /*width: MediaQuery.of(context).size.width*0.25,*/
                          ),
                          Container(
                              child: Expanded(
                                  child: Text(
                                      "Flutter, SpringBoot, Ubuntu, Windows, KaliLinux, ReactJS")))
                        ],
                      ),
                    ),
                  ],
                ))
            : Container()
      ])),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return listitem(Colors.black, (index).toString());
          },
          childCount: c,
        ),
      ),
    ]);
  }

  Widget listitem(Color color, String title) => Card(
      margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/alucard.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Harsha Vardhan",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                            "Date and Time",
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Divider(thickness: 1),
            // Container(
            //   height: 250,
            //   child: Center(
            //     child: Image.asset(
            //       "assets/logo.png",
            //       //fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpandablePanel(
                header: Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Image.asset(
                    "assets/index.jpg",
                    fit: BoxFit.cover,
                    //fit: BoxFit.cover,
                  ),
                ),
                collapsed: Linkify(
                  onOpen: (link) async {
                    if (await canLaunch(link.url)) {
                      await launch(link.url);
                    } else {
                      throw 'sorry';
                    }
                  },
                  text: bio1,
                  style: TextStyle(color: Colors.black),
                  linkStyle: TextStyle(color: Colors.blue),
                  options: LinkifyOptions(humanize: false),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
                expanded: Linkify(
                  onOpen: (link) async {
                    if (await canLaunch(link.url)) {
                      await launch(link.url);
                    } else {
                      throw 'sorry';
                    }
                  },
                  text: bio1,
                  style: TextStyle(color: Colors.black),
                  linkStyle: TextStyle(color: Colors.blue),
                  options: LinkifyOptions(humanize: false),
                  overflow: TextOverflow.visible,
                ),
                tapHeaderToExpand: true,
                hasIcon: false,
              ),
            ),

            Divider(
              thickness: 1,
            ),
            ExpandablePanel(
              tapHeaderToExpand: false,
              header: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.favorite,
                                color: Colors.pinkAccent[200],
                                size: 30,
                              ),
                              Text(
                                "198",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black54),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.comment,
                                color: Colors.green,
                                size: 30,
                              ),
                              Text(
                                "19",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black54),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              expanded: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "View all comments ..",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: TextFormField(
                            textCapitalization: TextCapitalization.sentences,
                            onChanged: (value) {
                              //
                              //comment operations!
                              //
                            },
                            decoration: InputDecoration(
                                hintText: "Text for comment ..",
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.amber,
                          onPressed: () {},
                          child: Text("Comment"),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ));
}
