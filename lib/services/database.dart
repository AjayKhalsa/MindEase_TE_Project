import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app3/models/brew.dart';
import 'package:flutter_app3/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection ref
  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');
  Future<void> updateUserData(
      String sugars, String name, int strength) async {
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
      // 'accept': accept,
    });
  }

//brew list from snapshort
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugars: doc.data['sugars'] ?? '0',
        
      );
    }).toList();
  }

  //user data from snapshorts
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      sugars: snapshot.data['sugars'],
      strength: snapshot.data['strength'],
    );
  }

// get strems
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  //get user
  Stream<UserData> get userData {
    return brewCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
