import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:signin_authentication/provider/facebooksigninprovider.dart';
//import 'package:provider/provider.dart';

class FacebookSignupButtonWidget extends StatefulWidget {
  @override
  _FacebookSignupButtonWidgetState createState() =>
      _FacebookSignupButtonWidgetState();
}

class _FacebookSignupButtonWidgetState
    extends State<FacebookSignupButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: OutlineButton.icon(
        onPressed: () {
          new LoginWithFacebook();
        },
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        highlightedBorderColor: Colors.black,
        borderSide: BorderSide(color: Colors.black),
        textColor: Colors.black,
        icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.blue),
        label: Text(
          'Sign In With Facebook',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
