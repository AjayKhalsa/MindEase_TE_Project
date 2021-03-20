class User {
  final String uid;
  User({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String sugars;
  final int strength;
  // final String accept;
  UserData({this.uid, this.sugars, this.strength, this.name});
// ignore: empty_constructor_bodies
}

class UserDoc {
  final String uid;
  final String name;
  final int phone;
  final String address;
  UserDoc({this.uid, this.name, this.phone, this.address});
// ignore: empty_constructor_bodies
}
