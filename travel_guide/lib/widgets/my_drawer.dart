import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide/screens/edit_profile.dart';
import 'package:travel_guide/screens/setting.dart';
import '../global/global.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        //  padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              profileModel.name.toString(),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            accountEmail: Text(
              profileModel.email.toString(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            ),
            currentAccountPicture: const Padding(
              padding: EdgeInsets.only(right: 10, top: 10),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 35,
                  color: Colors.green,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            trailing: const Icon(Icons.navigate_next),
            onTap: () => Get.to(const EditProfile()),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Setting"),
            trailing: const Icon(Icons.navigate_next),
            onTap: () => Get.to(const SettingPage()),
          ),
          const Divider(thickness: 2),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Contact us on",
                  style: TextStyle(fontSize: 17),
                ),
                Text(
                  "travelguide333@gmail.com",
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                Text(
                  "0900-078601",
                  style: TextStyle(fontWeight: FontWeight.w300),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
