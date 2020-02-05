import 'dart:io';

import 'package:expandable/expandable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:bvrit/upload.dart';
import 'package:path/path.dart' as path;
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:amazon_cognito_identity_dart/sig_v4.dart';

class Feed extends StatefulWidget {
  @override
  _Feed createState() => new _Feed();
}

 
class _Feed extends State<Feed> {
  String s = "";
  void upload(file) async{
  const _accessKeyId = 'AKIA2AR6F4WU2QK5AA4Z';
  const _secretKeyId = 'TxCJSlIBdXKHeAMKjiIFi3RDpmnNfJFMN5JUr8xz';
  const _region = 'ap-south-1';
  const _s3Endpoint =
      'https://bvritconnect.s3-ap-south-1.amazonaws.com';

  //final file = File(path.join('/storage/emulated/0/Download/', '1580037282286.jpg'));
  final stream = http.ByteStream(DelegatingStream.typed(file.openRead()));
  final length = await file.length();
  final uri = Uri.parse(_s3Endpoint);
  final req = new http.MultipartRequest("POST", uri);
  //final req = new http.Mu
  print(file.path);
  print(req.headers);
  final multipartFile = http.MultipartFile('file', stream, length,
      filename: path.basename(file.path));
  //final multipartFile = await http.MultipartFile.fromPath('image/jpeg', file.path, contentType: new MediaType("image","jpeg"));
  print(multipartFile.field);

  final policy = Policy.fromS3PresignedPost(multipartFile.filename,
      'bvritconnect', _accessKeyId, 15, length,
      region: _region);
  print(length);
  final key =
      SigV4.calculateSigningKey(_secretKeyId, policy.datetime, _region, 's3');
  final signature = SigV4.calculateSignature(key, policy.encode());
  print(policy.credential);
  print(policy.datetime);
  print(policy.encode());
  print(signature);
  print(multipartFile.contentType);
  req.files.add(multipartFile);
  req.fields['key'] = policy.key;
  req.fields['acl'] = 'public-read';
  req.fields['X-Amz-Credential'] = policy.credential;
  req.fields['X-Amz-Algorithm'] = 'AWS4-HMAC-SHA256';
  req.fields['X-Amz-Date'] = policy.datetime;
  req.fields['Policy'] = policy.encode();
  req.fields['X-Amz-Signature'] = signature;
  req.fields['success_action_redirect'] = "http://bvritconnect.s3.amazonaws.com/successful_upload.html";
  req.fields['Content-Type'] = "image/jpeg";
  req.fields['x-amz-meta-uuid'] = "14365123651274";
  req.fields['x-amz-server-side-encryption'] = "AES256";
  req.fields['x-amz-meta-tag'] = "";
  setState(() {
    s = req.fields.toString();
  });
  print(req.fields);
  
  try {
    final res = await req.send();
    await for (var value in res.stream.transform(utf8.decoder)) {
      print(value);
    }
  } catch (e) {
    //print(e.toString());
  }
}
  int c = 6;
  String str =
      "visit https://veggiesbasket.com and Hi, I am a very lazy person";
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          forceElevated: true,
          elevation: 6,
          backgroundColor: Colors.white,
          floating: false,
          pinned: true,
          expandedHeight: MediaQuery.of(context).size.height * 0.4,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              " Bvrit Connect ",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontSize: MediaQuery.of(context).size.height * 0.03,
                fontWeight: FontWeight.bold,
              ),
            ),
            background: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.31,
                  child: Image.asset(
                    "assets/alucard.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.09,
                  color: Colors.lightBlue,
                )
              ],
            ),
          ),
          actions: <Widget>[
            CircleAvatar(
                key: Key("shaw"),
                backgroundColor: Colors.transparent,
                radius: 40,
                child: FlatButton(
                  onPressed: () {
                    this.setState(() {
                      c = c + 1;
                    });
                  },
                  child: Icon(
                    Icons.people,
                    color: Colors.green,
                    size: 35,
                  ),
                )),
          ],
        ),
        SliverList(
          delegate: SliverChildListDelegate(<Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, top: 25, bottom: 10, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
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
                            Text(
                              "Your UserName",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("Additional information",
                                style: TextStyle(color: Colors.black54))
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(s,softWrap: true,),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black54),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              maxLength: 200,
                              maxLines: 5,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Post something .."),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: ()async{
                          File file = await FilePicker.getFile();
                          upload(file);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 8),
                          child: Icon(Icons.add_a_photo),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 8),
                        child: Icon(Icons.add_to_photos),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 20),
              child: FlatButton(
                color: Colors.orange,
                onPressed: () {},
                child: Text("Make a Post"),
              ),
            )
          ]),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return listitem(Colors.black, (index).toString());
            },
            childCount: c,
          ),
        ),
      ],
    );
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
                          Text("Posted By $title",
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
                  ),
                ),
                // Text(
                //   "bvrit information about you",
                //   style: TextStyle(fontSize: 20),
                // ),
                collapsed: Linkify(
                  onOpen: (link) async {
                    if (await canLaunch(link.url)) {
                      await launch(link.url);
                    } else {
                      throw 'sorry';
                    }
                  },
                  text: str,
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
                  text: str,
                  style: TextStyle(color: Colors.black),
                  linkStyle: TextStyle(color: Colors.blue),
                  options: LinkifyOptions(humanize: false),
                  overflow: TextOverflow.visible,
                ),
                tapHeaderToExpand: true,
                hasIcon: false,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 8.0),
            //   child: Text(
            //     "Related: Post related information is displayed in this area $title",
            //     style: TextStyle(fontSize: 15, color: Colors.black),
            //   ),
            // ),
            Divider(
              thickness: 1,
            ),

            ExpandablePanel(
              tapHeaderToExpand: false,
              header: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.favorite,
                                color: Colors.orange,
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: <Widget>[
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
                                "98",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black54),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
