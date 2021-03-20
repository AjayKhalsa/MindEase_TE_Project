import 'package:flutter/material.dart';
import 'package:flutter_app3/screens/authenticate/authenticate.dart';
import 'package:flutter_app3/screens/home/home_user.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app3/models/user.dart';
import 'package:flutter_app3/screens/authenticate/register.dart';
import 'package:flutter_app3/screens/authenticate/sign_in.dart';
import 'package:flutter_app3/screens/home/home_doctor.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else if (Register.userv == 'Doctor' || SignIn.userv=='Doctor' ) {
      return DoctorScreen();
    } else {
      return UserScreen();
    }
  }
}
