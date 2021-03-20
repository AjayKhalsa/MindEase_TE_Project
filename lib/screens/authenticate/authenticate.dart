import 'package:flutter/material.dart';
import 'package:flutter_app3/screens/authenticate/sign_in.dart';
//import 'package:flutter_app3/screens/register.dart';
import 'package:flutter_app3/screens/authenticate/register.dart';
//import 'package:flutter_app3/screens/authenticate/register_doctor.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
      // }else{
      //   return RegisterUser(toggleView : toggleView);
    }
  }
}
