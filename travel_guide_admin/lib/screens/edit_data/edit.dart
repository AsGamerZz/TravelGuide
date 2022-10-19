import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../global/global.dart';

class Edit extends StatefulWidget {
  String? name, city, address, desc, image, uid;

  Edit(
      {Key? key,
      this.address,
      this.name,
      this.city,
      this.desc,
      this.image,
      this.uid})
      : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();
  final cityController = TextEditingController();
  String? uid;

  @override
  initState() {
    super.initState();
    nameController.text = widget.name!.toString();
    cityController.text = widget.city!.toString();
    locationController.text = widget.address!.toString();
    descriptionController.text = widget.desc!.toString();
    uid = widget.uid.toString();
  }

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
        elevation: 0,
        backgroundColor: Colors.green,
        title: const Text("Edit Data"),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                height: MediaQuery.of(context).size.height - 50,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          inputFile(label: "Name", controller: nameController),
                          inputFile(
                              label: "Location",
                              controller: locationController),
                          inputFile(label: "City", controller: cityController),
                          inputFile(
                            label: "Description",
                            controller: descriptionController,
                            max: 5,
                          ),
                          const SizedBox(height: 10),
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
                          updateDataOnDB();
                        },
                        child: Text(
                          "Update DATA".toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  updateDataOnDB() async {
    setState(() {
      isLoading = true;
    });
    if (fauth.currentUser != null) {
      Map hotelsmap = {
        "hotelname": nameController.text.trim(),
        "hotellocation": locationController.text.trim(),
        "hotelcity": cityController.text.trim(),
        "hoteldescription": descriptionController.text.trim(),
      };

      DatabaseReference ref = fdb.ref().child("tour_places");
      ref.child("hotel").child(uid!.toString()).set(hotelsmap);

      Fluttertoast.showToast(msg: "Place Data has been Added.");
      setState(() {
        isLoading = false;
      });
    } else {
      Fluttertoast.showToast(msg: "Cannot add data right now.");
    }
  }
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
