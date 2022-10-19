// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide_admin/screens/hotels.dart';
import 'package:travel_guide_admin/screens/places.dart';
import 'package:travel_guide_admin/screens/restaurents.dart';
import 'package:travel_guide_admin/screens/routes.dart';

class SelectWhatToAdd extends StatefulWidget {
  const SelectWhatToAdd({Key? key}) : super(key: key);

  @override
  State<SelectWhatToAdd> createState() => _SelectWhatToAddState();
}

class _SelectWhatToAddState extends State<SelectWhatToAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose What to Add"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.hotel),
            title: Text("Add Hotel"),
            trailing: Icon(Icons.navigate_next),
            horizontalTitleGap: 0,
            onTap: () => Get.to(const Hotels()),
          ),
          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text("Add Retaurents"),
            trailing: Icon(Icons.navigate_next),
            horizontalTitleGap: 0,
            onTap: () => Get.to(const Restaurents()),
          ),
          ListTile(
            leading: Icon(Icons.location_city),
            title: Text("Add Places"),
            trailing: Icon(Icons.navigate_next),
            horizontalTitleGap: 0,
            onTap: () => Get.to(const Places()),
          ),
          ListTile(
            leading: Icon(Icons.bus_alert),
            title: Text("Add Routes"),
            trailing: Icon(Icons.navigate_next),
            horizontalTitleGap: 0,
            onTap: () => Get.to(const Routes()),
          ),
        ],
      ),
    );
  }
}
