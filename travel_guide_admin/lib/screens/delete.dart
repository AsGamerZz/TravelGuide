import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide_admin/screens/delete_data/delete_hotel.dart';
import 'package:travel_guide_admin/screens/delete_data/delete_place.dart';
import 'package:travel_guide_admin/screens/delete_data/delete_restaurent.dart';
import 'package:travel_guide_admin/screens/delete_data/delete_route.dart';

class DeleteData extends StatefulWidget {
  const DeleteData({Key? key}) : super(key: key);

  @override
  State<DeleteData> createState() => _DeleteDataState();
}

class _DeleteDataState extends State<DeleteData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delete Data"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.hotel),
            title: const Text("Delete Hotel"),
            trailing: const Icon(Icons.navigate_next),
            horizontalTitleGap: 0,
            onTap: () => Get.to(const DeleteHotel()),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: const Text("Delete Retaurents"),
            trailing: const Icon(Icons.navigate_next),
            horizontalTitleGap: 0,
            onTap: () => Get.to(const DeleteRestaurent()),
          ),
          ListTile(
            leading: const Icon(Icons.location_city),
            title: const Text("Delete Places"),
            trailing: const Icon(Icons.navigate_next),
            horizontalTitleGap: 0,
            onTap: () => Get.to(const DeletePlace()),
          ),
          ListTile(
            leading: const Icon(Icons.bus_alert),
            title: const Text("Delete Routes"),
            trailing: const Icon(Icons.navigate_next),
            horizontalTitleGap: 0,
            onTap: () => Get.to(const DeleteRoute()),
          ),
        ],
      ),
    );
  }
}
