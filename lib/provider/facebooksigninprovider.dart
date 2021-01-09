import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class LoginWithFacebook extends StatefulWidget {
  @override
  _LoginWithFacebookState createState() => _LoginWithFacebookState();
}

class _LoginWithFacebookState extends State<LoginWithFacebook> {
  bool _isLognIn = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  User _user;
  FacebookLogin _facebookLogin = FacebookLogin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("facebook login"),
        ),
        body: !_isLognIn
            ? Center(
                child: OutlineButton(
                  onPressed: () async {
                    await handleLogin();
                  },
                  child: Text(
                    "Login with facebook",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      maxRadius: 25,
                      backgroundImage: NetworkImage(_user.photoURL),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Name: ' + _user.displayName,
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Email: ' + _user.email,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    OutlineButton(
                      onPressed: () async {
                        await facebookSignout();
                      },
                      child: Text(
                        "Logout",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
              ));
  }

  Future<void> handleLogin() async {
    final FacebookLoginResult result = await _facebookLogin.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.cancelledByUser:
        print("cancelled by User");
        break;
      case FacebookLoginStatus.error:
        print("error");
        break;
      case FacebookLoginStatus.loggedIn:
        try {
          await loginWithfacebook(result);
        } catch (e) {
          print(e);
        }
        break;

      default:
    }
  }

  Future loginWithfacebook(FacebookLoginResult result) async {
    final FacebookAccessToken accessToken = result.accessToken;
    AuthCredential credential =
        FacebookAuthProvider.credential(accessToken.token);
    var a = await _auth.signInWithCredential(credential);
    setState(() {
      _isLognIn = true;
      _user = a.user;
    });
  }

  Future<void> facebookSignout() async {
    await _auth.signOut().then((value) {
      setState(() {
        _facebookLogin.logOut();
        _isLognIn = false;
      });
    });
  }
}
