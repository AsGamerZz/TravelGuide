import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide_admin/screens/view_hotel.dart';
import 'package:travel_guide_admin/screens/view_places.dart';
import 'package:travel_guide_admin/screens/view_restaurent.dart';
import 'package:travel_guide_admin/screens/view_routes.dart';

class ViewData extends StatefulWidget {
  const ViewData({Key? key}) : super(key: key);

  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("view Data"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.hotel),
            title: const Text("View Hotel"),
            trailing: const Icon(Icons.navigate_next),
            horizontalTitleGap: 0,
            onTap: () => Get.to(const ViewHotels()),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: const Text("View Retaurents"),
            trailing: const Icon(Icons.navigate_next),
            horizontalTitleGap: 0,
            onTap: () => Get.to(const ViewRestaurents()),
          ),
          ListTile(
            leading: const Icon(Icons.location_city),
            title: const Text("View Places"),
            trailing: const Icon(Icons.navigate_next),
            horizontalTitleGap: 0,
            onTap: () => Get.to(const ViewPlaces()),
          ),
          ListTile(
            leading: const Icon(Icons.bus_alert),
            title: const Text("View Routes"),
            trailing: const Icon(Icons.navigate_next),
            horizontalTitleGap: 0,
            onTap: () => Get.to(const ViewRoutes()),
          ),
        ],
      ),
    );
  }
}
