import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:signin_authentication/pages/homepage.dart';

//import 'package:signin_authentication/provider/facebooksigninprovider.dart';
//import 'package:signin_authentication/pages/google-signupbtn.dart';
//fluimport 'package:signin_authentication/pages/homepage.dart';
//import 'package:firebase_auth/firebase_auth.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SignIn Authenticator App",
      theme: ThemeData(
        primaryColor: Colors.blueGrey[700],
      ),
      home: HomePage(),
    );
  }
}
