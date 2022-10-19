import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide_admin/screens/edit_data/edit_hotel.dart';
import 'package:travel_guide_admin/screens/edit_data/edit_place.dart';
import 'package:travel_guide_admin/screens/edit_data/edit_restaurent.dart';
import 'package:travel_guide_admin/screens/edit_data/edit_route.dart';

class EditData extends StatefulWidget {
  const EditData({Key? key}) : super(key: key);

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Data"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.hotel),
            title: const Text("Edit Hotel"),
            trailing: const Icon(Icons.navigate_next),
            horizontalTitleGap: 0,
            onTap: () => Get.to(const EditHotel()),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: const Text("Edit Retaurents"),
            trailing: const Icon(Icons.navigate_next),
            horizontalTitleGap: 0,
            onTap: () => Get.to(const EditRestaurent()),
          ),
          ListTile(
            leading: const Icon(Icons.location_city),
            title: const Text("Edit Places"),
            trailing: const Icon(Icons.navigate_next),
            horizontalTitleGap: 0,
            onTap: () => Get.to(const EditPlace()),
          ),
          ListTile(
            leading: const Icon(Icons.route),
            title: const Text("Edit Routes"),
            trailing: const Icon(Icons.navigate_next),
            horizontalTitleGap: 0,
            onTap: () => Get.to(const EditRoute()),
          ),
        ],
      ),
    );
  }
}
