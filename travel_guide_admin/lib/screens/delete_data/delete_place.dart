import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide_admin/global/global.dart';

import '../detail.dart';

class DeletePlace extends StatefulWidget {
  const DeletePlace({Key? key}) : super(key: key);

  @override
  State<DeletePlace> createState() => _DeletePlaceState();
}

class _DeletePlaceState extends State<DeletePlace> {
  final ref =
      FirebaseDatabase.instance.ref().child("tour_places").child("places");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delete Places"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: FirebaseAnimatedList(
        query: ref,
        itemBuilder: (context, snap, animation, index) {
          Map list = snap.value as Map;
          if (snap.value != null) {
            return InkWell(
              onTap: () {
                Get.to(Detail(
                  name: list["placename"],
                  city: list["placecity"],
                  address: list["placelocation"],
                  disc: list["placedescription"],
                  image: list["imageURL"],
                ));
              },
              onLongPress: () {
                Get.defaultDialog(
                  title: "Alert",
                  titlePadding: const EdgeInsets.all(15),
                  textConfirm: "yes",
                  textCancel: "Cancel",
                  confirmTextColor: Colors.white,
                  middleText:
                      "Do you want to delete data of ${list['placename']}",
                  cancelTextColor: Colors.green.shade700,
                  onConfirm: () {
                    fdb
                        .ref()
                        .child("tour_places")
                        .child("places")
                        .child(snap.key.toString())
                        .remove();
                    Get.back();
                  },
                  onCancel: () {
                    return;
                  },
                );
              },
              child: Card(
                margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.network(list["imageURL"]),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(list["placename"]),
                              Text(list["placecity"]),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
