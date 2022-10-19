import 'package:firebase_database/firebase_database.dart';

class ProfileModel {
  String? name;
  String? email;

  ProfileModel({this.email, this.name});

  ProfileModel.fromDataSnapshot(DataSnapshot snapshot) {
    name = (snapshot.value as dynamic)["name"];
    email = (snapshot.value as dynamic)["email"];
  }
}
