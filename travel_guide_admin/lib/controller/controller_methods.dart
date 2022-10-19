import 'package:firebase_database/firebase_database.dart';
import 'package:travel_guide_admin/global/global.dart';

class ControllerMethods {
  static void readAdminData() {
    var ref = FirebaseDatabase.instance.ref();
    ref.child("admin").child(fauth.currentUser!.uid).onValue.listen(
      (event) {
        if (event.snapshot.value != null) {
          profile.name = (event.snapshot.value as Map)["name"];
          profile.email = (event.snapshot.value as Map)["email"];
        }
      },
    );
  }
}
