import 'package:flutter/material.dart';
import 'package:flutter_app3/models/user.dart';
import 'package:flutter_app3/services/database.dart';
import 'package:flutter_app3/shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app3/shared/loading.dart';
import 'package:flutter_app3/globals.dart' as globals;


class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  //final List<String> sugars = ['0', '1', '2', '3', '4'];
  //final List<int> strengths = [100, 200, 300, 400, 500, 600, 700, 800, 900];
  String _currentName;
  String _currentSugars;
  int _currentStrength;
  String _currentaccept;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update your settings.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  // Text('Name',

                  //     style: TextStyle(fontSize: 15.0),
                  //     textAlign: TextAlign.left),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text("Name", style: TextStyle(fontSize: 15.0)),
                    ),
                  ),

                  SizedBox(height: 10.0),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() {
                      _currentName = val;
                      globals.name = _currentName;
                    }),
                  ),
                  SizedBox(height: 10.0),
                  // TextFormField(
                  //   initialValue: userData.name,
                  //   decoration: textInputDecoration,
                  //   validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                  //   onChanged: (val) => setState(() => _currentName = val),
                  // ),
                  // DropdownButtonFormField(
                  //   value: _currentSugars ?? userData.sugars,
                  //   decoration: textInputDecoration,
                  //   items: sugars.map((sugar) {
                  //     return DropdownMenuItem(
                  //       value: sugar,
                  //       child: Text('$sugar sugars'),
                  //     );
                  //   }).toList(),
                  //   onChanged: (val) => setState(() => _currentSugars = val ),
                  // ),
                  // SizedBox(height: 10.0),
                  // TextFormField(
                  //   initialValue: userData.name,
                  //   decoration: textInputDecoration,
                  //   validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                  //   onChanged: (val) => setState(() => _currentName = val),
                  // ),
                  // Slider(
                  //   value: (_currentStrength ?? userData.strength).toDouble(),
                  //   activeColor: Colors.brown[_currentStrength ?? userData.strength],
                  //   inactiveColor: Colors.brown[_currentStrength ?? userData.strength],
                  //   min: 100.0,
                  //   max: 900.0,
                  //   divisions: 8,
                  //   onChanged: (val) => setState(() => _currentStrength = val.round()),
                  // ),

                  ElevatedButton(
                      // color: Colors.pink[400],
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await DatabaseService(uid: user.uid).updateUserData(
                            _currentSugars ?? snapshot.data.sugars,
                            _currentName ?? snapshot.data.name,
                            _currentStrength ?? snapshot.data.strength,
                          );
                          Navigator.pop(context);
                        }
                      }),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
