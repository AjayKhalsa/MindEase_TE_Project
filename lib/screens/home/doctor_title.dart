import 'package:flutter/material.dart';
import 'package:flutter_app3/models/brew.dart';

//import 'package:flutter_app3/screens/home/brew_list.dart';

class DoctorTile extends StatelessWidget {
  final Doctor doctor;
  DoctorTile({this.doctor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: Column(
             children: <Widget>[ ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.brown[doctor.phone],
            ),
            title: Text(doctor.name),
            subtitle: Text('Takes ${doctor.address} sugar(s)'),
          ),
          ButtonBar(
              children: <Widget>[
               
           ElevatedButton(
                  child: const Text('BTN1'),
                  onPressed: () {/* ... */},
                ),
                
                ElevatedButton(
                  child: const Text('BTN2'),
                  onPressed: () {/* ... */},
                ),
              ],
            ),
             ],
        ),
      ),
    );
  }
}
