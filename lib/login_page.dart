
import 'package:flutter/material.dart';
import 'package:bvrit/home_page.dart';
import 'package:http/http.dart' as http;

//final xstorage =  new FlutterSecureStorage();

class Post {
  final String collegeemail;
  final String password;

  Post({this.collegeemail, this.password});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      collegeemail: json['collegeemail'],
      password: json['password'],
    );
  }
}

Future<http.Response> createPost(String url, {String body}) async {
  http.Response res = await http.post(url,
      headers: {"Content-type": "application/json"}, body: body);
  return res;
}

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  final Future<Post> post;

  LoginPage({Key key, this.post}) : super(key: key);

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userControler = new TextEditingController();
  TextEditingController passControler = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 100.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      controller: userControler,
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      controller: passControler,
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: ()
            async {
          print(userControler.text);
          print(passControler.text);
          // Post newPost = new Post(
          //     collegeemail: userControler.text, password: passControler.text);
          // http.Response shaw = await createPost(
          //     'https://bvritconnecttest.herokuapp.com/api/auth/signin',
          //     body:
          //         '{"username": "${newPost.collegeemail}", "password": "${newPost.password}"}');
          // final s = jsonDecode(shaw.body);
          // xstorage.write(key: 'accessToken', value: "Bearer "+s['accessToken']);
          // print(s['accessToken']);
          // if (shaw.statusCode == 200) {
            Navigator.of(context).pushNamed(HomePage.tag);
          // } else {
          //   showDialog(
          //     context: context,
          //     builder: (BuildContext context) {
          //       // return object of type Dialog
          //       return AlertDialog(
          //         title: new Text("Warning !"),
          //         content: new Text("Invalid Credentials !"),
          //         actions: <Widget>[
          //           // usually buttons at the bottom of the dialog
          //           new FlatButton(
          //             child: new Text("OK"),
          //             onPressed: () {
          //               Navigator.of(context).pop();
          //             },
          //           ),
          //         ],
          //       );
          //     },
          //   );
          // }
          // return CircularProgressIndicator();
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text("Sign In", style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        "Forgot Password?",
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 25.0),
            email,
            SizedBox(height: 15.0),
            password,
            SizedBox(height: 20.0),
            loginButton,
            forgotLabel,
          ],
        ),
      ),
    );
  }
}
