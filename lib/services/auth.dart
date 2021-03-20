import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app3/models/user.dart';
import 'package:flutter_app3/services/database.dart';
//import 'package:flutter_app3/services/database_doctor.dart';
import 'package:flutter_app3/screens/authenticate/register.dart';
import 'package:flutter_app3/services/database_doctor.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //user obj
  User _userFromFirebaseUser(FirebaseUser user) {
    // ignore: unnecessary_null_comparison
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      //new documentation
      // await DatabaseService(uid: user.uid)
      //     .updateUserData('0', 'new crew member', 100);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //resgister

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      if (Register.userv == 'Doctor') {
        await DoctorDatabaseService(uid: user.uid)
            .updateUserData('0', 'doctor', 100);
      } else {
        await DatabaseService(uid: user.uid)
            .updateUserData('0', 'new crew member', 100);
      }

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
