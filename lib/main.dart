import 'package:bvrit/create_profile.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/services.dart';



void main() { runApp(MyApp());
//SystemChrome.setEnabledSystemUIOverlays([]);
// SystemChrome.setSystemUIOverlayStyle(
//       SystemUiOverlayStyle(statusBarColor: Colors.black));
}

class MyApp extends StatelessWidget {
  
  

  //final xstorage = FlutterSecureStorage();

  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
    ProfileCreate.tag: (context) => ProfileCreate()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bvrit Connect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito',
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}