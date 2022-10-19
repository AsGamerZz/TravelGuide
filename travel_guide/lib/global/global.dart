import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:travel_guide/global/history.dart';
import 'package:travel_guide/model/profile_model.dart';

final FirebaseAuth fauth = FirebaseAuth.instance;
User? currentFirebaseUser;
FirebaseDatabase fdb = FirebaseDatabase.instance;
ProfileModel profileModel = ProfileModel();
String cityName = "Multan";
List places = [];
List hotels = [];
List restaurents = [];
List routes = [];
List crousel = [];
const images = [
  "assets/images/khyber.jpeg",
  "assets/images/minare_pak.jpeg",
  "assets/images/quaid_mazar.jpeg",
  "assets/images/quaid_res.jpeg",
  "assets/images/multan.jpg",
];

Map<String, dynamic> history = {
  "Multan": {
    "cityHistory": multan,
    "image": "assets/images/multan.jpg",
  },
  "Islamabad": {
    "cityHistory": islamabad,
    "image": "assets/images/faisal.jpg",
  },
  "Karachi": {
    "cityHistory": karachi,
    "image": "assets/images/quaid_mazar.jpeg",
  },
  "Lahore": {
    "cityHistory": lahore,
    "image": "assets/images/minare_pak.jpeg",
  },
  "Peshawar": {
    "cityHistory": peshawar,
    "image": "assets/images/khyber.jpeg",
  },
};
