import 'package:flutter/material.dart';
import 'package:flutter_app3/models/brew.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app3/screens/home/doctor_title.dart';

class DoctorList extends StatefulWidget {
  @override
  _DoctorListState createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  @override
  Widget build(BuildContext context) {
    final doctors = Provider.of<List<Doctor>>(context) ?? [];
    //print(brews.documents);
    // brews.forEach((brew) {
    //   print(brew.name);
    //   print(brew.sugars);
    //   print(brew.strength);
    // });

    return ListView.builder(
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return DoctorTile(doctor: doctors[index]);
      },
    );
  }
}
