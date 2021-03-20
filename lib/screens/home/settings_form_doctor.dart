import 'package:flutter/material.dart';
import 'package:flutter_app3/models/user.dart';
import 'package:flutter_app3/services/database_doctor.dart';
import 'package:flutter_app3/shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app3/shared/loading.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> address = ['0', '1', '2', '3', '4'];
  final List<int> phone = [100, 200, 300, 400, 500, 600, 700, 800, 900];
  String _currentName;
  String _currentSugars;
  int _currentStrength;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserDoc>(
        stream: DoctorDatabaseService(uid: user.uid).userDoc,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserDoc userDoc = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update your brew settings.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userDoc.name,
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(height: 10.0),
                  // DropdownButtonFormField(
                  //   value: _currentSugars ?? userDoc.address,
                  //   decoration: textInputDecoration,
                  //   items: address.map((address) {
                  //     return DropdownMenuItem(
                  //       value: address,
                  //       child: Text('$address sugars'),
                  //     );
                  //   }).toList(),
                  //   onChanged: (val) => setState(() => _currentSugars = val),
                  // ),
                  SizedBox(height: 10.0),
                  // Slider(
                  //   value: (_currentStrength ?? userDoc.phone).toDouble(),
                  //   activeColor:
                  //       Colors.brown[_currentStrength ?? userDoc.phone],
                  //   inactiveColor:
                  //       Colors.brown[_currentStrength ?? userDoc.phone],
                  //   min: 100.0,
                  //   max: 900.0,
                  //   divisions: 8,
                  //   onChanged: (val) =>
                  //       setState(() => _currentStrength = val.round()),
                  // ),
                 
                 ElevatedButton(
                      // color: Colors.pink[400],
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await DoctorDatabaseService(uid: user.uid)
                              .updateUserData(
                            _currentSugars ?? snapshot.data.address,
                            _currentName ?? snapshot.data.name,
                            _currentStrength ?? snapshot.data.phone,
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
