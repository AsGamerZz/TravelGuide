import 'package:travel_guide/global/global.dart';

class ControllerMethods {
  static void readProfileData() {
    var ref = fdb.ref();
    ref.child("customers").child(fauth.currentUser!.uid).once().then((snap) {
      if (snap.snapshot.value != null) {
        profileModel.id = (snap.snapshot.value as Map)["id"];
        profileModel.name = (snap.snapshot.value as Map)["name"];
        profileModel.city = (snap.snapshot.value as Map)["city"];
        profileModel.email = (snap.snapshot.value as Map)["email"];
      }
      return;
    });
  }
}
