import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:travel_guide_admin/model/profile_model.dart';

final FirebaseAuth fauth = FirebaseAuth.instance;
User? currentFirebaseUser;
FirebaseDatabase fdb = FirebaseDatabase.instance;
ProfileModel profile = ProfileModel();
