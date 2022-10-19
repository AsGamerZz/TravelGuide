import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../detail.dart';

class EditRestaurent extends StatefulWidget {
  const EditRestaurent({Key? key}) : super(key: key);

  @override
  State<EditRestaurent> createState() => _EditRestaurentState();
}

class _EditRestaurentState extends State<EditRestaurent> {
  final ref =
      FirebaseDatabase.instance.ref().child("tour_places").child("restaurent");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Restaurents"),
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
                  name: list["restaurentname"],
                  city: list["restaurentcity"],
                  address: list["restaurentlocation"],
                  disc: list["restaurentdescription"],
                  image: list["imageURL"],
                ));
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
                              Text(list["restaurentname"]),
                              Text(list["restaurentcity"]),
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
