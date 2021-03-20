import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app3/models/brew.dart';
import 'package:flutter_app3/models/user.dart';

class DoctorDatabaseService {
  final String uid;
  DoctorDatabaseService({this.uid});

  //collection ref
  final CollectionReference brewCollection =
      Firestore.instance.collection('doctors');
  Future<void> updateUserData(String address, String name, int phone) async {
    return await brewCollection.document(uid).setData({
      'address': address,
      'name': name,
      'phone': phone,
    });
  }

//brew list from snapshort
  List<Doctor> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Doctor(
        name: doc.data['name'] ?? '',
        phone: doc.data['phone'] ?? 0,
        address: doc.data['address'] ?? '0',
      );
    }).toList();
  }

  //user data from snapshorts
  UserDoc _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserDoc(
      uid: uid,
      name: snapshot.data['name'],
      address: snapshot.data['address'],
      phone: snapshot.data['phone'],
    );
  }

// get strems
  Stream<List<Doctor>> get doctor {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  //get user
  Stream<UserDoc> get userDoc {
    return brewCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
