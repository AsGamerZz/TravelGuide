import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_guide_admin/global/global.dart';

class Places extends StatefulWidget {
  const Places({Key? key}) : super(key: key);

  @override
  State<Places> createState() => _PlacesState();
}

class _PlacesState extends State<Places> {
  final placenameController = TextEditingController();
  final placelocationController = TextEditingController();
  final placedescriptionController = TextEditingController();
  final placecityController = TextEditingController();
  final placelatitudeController = TextEditingController();
  final placelongitudeController = TextEditingController();

  String imagename = "";
  XFile? imagePath;
  final ImagePicker picker = ImagePicker();

  var ref = FirebaseDatabase.instance;
  var storageRef = FirebaseStorage.instance;
  String collectionName = "tour_places";

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Add New Places"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.green,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              padding: const EdgeInsets.all(25),
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    inputFile(
                        label: "Place Name", controller: placenameController),
                    inputFile(
                        label: "Location", controller: placelocationController),
                    inputFile(label: "City", controller: placecityController),
                    inputFile(
                      label: "Description",
                      controller: placedescriptionController,
                      max: 5,
                    ),
                    inputFile(
                      label: "Longitude",
                      controller: placelongitudeController,
                    ),
                    inputFile(
                      label: "Latitude",
                      controller: placelatitudeController,
                    ),
                    const SizedBox(height: 10),
                    Text(imagename),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green.shade800,
                          fixedSize: const Size(150, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          side: BorderSide(color: Colors.green.shade800)),
                      onPressed: () {
                        pickerImage();
                      },
                      child: const Text(
                        "Pick Image",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          letterSpacing: 1.2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      fixedSize: const Size(150, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      side: BorderSide(color: Colors.green.shade800)),
                  onPressed: () {
                    uploadImageAndDataOnDB();
                  },
                  child: const Text(
                    "UPLOAD DATA",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      letterSpacing: 1.2,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  pickerImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imagePath = image;
        imagename = image.name.toString();
      });
    }
  }

  uploadImageAndDataOnDB() async {
    setState(() {
      isLoading = true;
    });
    if (fauth.currentUser != null) {
      String uploadFileName =
          DateTime.now().microsecondsSinceEpoch.toString() + '.jpg';

      var reference =
          storageRef.ref().child(collectionName).child(uploadFileName);
      var uploadTask = reference.putFile(File(imagePath!.path));

      await uploadTask.whenComplete(() async {
        var uploadPath = await uploadTask.snapshot.ref.getDownloadURL();

        Map placesmap = {
          "placename": placenameController.text.trim(),
          "placelocation": placelocationController.text.trim(),
          "placecity": placecityController.text.trim(),
          "placedescription": placedescriptionController.text.trim(),
          "placelongitude": double.parse(placelongitudeController.text.trim()),
          "placelatitude": double.parse(placelatitudeController.text.trim()),
          "imageURL": uploadPath,
        };

        DatabaseReference ref = fdb.ref().child("tour_places");
        ref.child("places").push().set(placesmap);

        Fluttertoast.showToast(msg: "Place Data has been Added.");
        setState(() {
          isLoading = false;
        });
      });
    } else {
      Fluttertoast.showToast(msg: "Cannot add data right now.");
    }
  }

  // savePlaceData() async {
  //   if (fauth.currentUser != null) {
  //     Map placesmap = {
  //       "placename": placenameController.text.trim(),
  //       "placelocation": placelocationController.text.trim(),
  //       "placecity": placecityController.text.trim(),
  //       "placedescription": placedescriptionController.text.trim(),
  //     };

  //     DatabaseReference ref = fdb.ref().child("tour_places");
  //     ref.child("places").push().set(placesmap);

  //     Fluttertoast.showToast(msg: "Place Data has been Added.");
  //   } else {
  //   }
  // }
}

// we will be creating a widget for text field
Widget inputFile({label, obscureText = false, controller, value, max}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      const SizedBox(
        height: 5,
      ),
      TextField(
        onChanged: value,
        controller: controller,
        obscureText: obscureText,
        maxLines: max,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
      ),
      const SizedBox(
        height: 10,
      )
    ],
  );
}
