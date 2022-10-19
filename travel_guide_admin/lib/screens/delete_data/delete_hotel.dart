import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global/global.dart';
import '../detail.dart';

class DeleteHotel extends StatefulWidget {
  const DeleteHotel({Key? key}) : super(key: key);

  @override
  State<DeleteHotel> createState() => _DeleteHotelState();
}

class _DeleteHotelState extends State<DeleteHotel> {
  final ref =
      FirebaseDatabase.instance.ref().child("tour_places").child("hotel");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delete Hotels"),
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
                  name: list["hotelname"],
                  city: list["hotelcity"],
                  address: list["hotellocation"],
                  disc: list["hoteldescription"],
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
                      "Do you want to delete data of ${list['hotelname']}",
                  cancelTextColor: Colors.green.shade700,
                  onConfirm: () {
                    fdb
                        .ref()
                        .child("tour_places")
                        .child("hotel")
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
                              Text(list["hotelname"]),
                              Text(list["hotelcity"]),
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
