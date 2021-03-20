import 'package:flutter/material.dart';
import 'package:flutter_app3/screens/home/doctor_list.dart';
import 'package:flutter_app3/screens/home/settings_form_doctor.dart';
import 'package:flutter_app3/services/auth.dart';
import 'package:flutter_app3/services/database_doctor.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app3/models/brew.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter_app3/screens/home/brew_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (conext) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Doctor>>.value(
      value: DoctorDatabaseService().doctor,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Doctor List'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          // actions: <Widget>[
          //   FlatButton.icon(
          //     icon: Icon(Icons.settings),
          //     label: Text('settings'),
          //     onPressed: () => _showSettingsPanel(),
          //   )
          // ],
        ),
        body: DoctorList(),
      ),
    );
  }
}
