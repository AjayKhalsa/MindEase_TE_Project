import 'package:flutter/material.dart';
import 'package:flutter_app3/models/brew.dart';

//import 'package:flutter_app3/screens/home/brew_list.dart';

class BrewTile extends StatelessWidget {
  final Brew brew;
  BrewTile({this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.brown[brew.strength],
              ),
              title: Text(brew.name),
              subtitle: Text('No. of patient ${brew.sugars}'),
            ),
            ButtonBar(
              children: <Widget>[
                ElevatedButton(
                  child: const Text('Request For Appointment'),
                  onPressed: () {/* ... */},
                ),
                ElevatedButton(
                  child: const Text('Cancel Appointment'),
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
