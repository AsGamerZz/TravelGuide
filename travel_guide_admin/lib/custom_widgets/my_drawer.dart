import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide_admin/global/global.dart';
import 'package:travel_guide_admin/screens/total_users.dart';
import 'package:travel_guide_admin/splash_screen/splash_screen.dart';

import '../screens/delete.dart';
import '../screens/edit_data.dart';

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
            accountName: Text(profile.name.toString()),
            accountEmail: Text(profile.email.toString()),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                size: 35,
                color: Colors.green,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text("Total Users"),
            onTap: () => Get.to(const TotalUsers()),
          ),
          ListTile(
            leading: const Icon(Icons.edit_note_sharp),
            title: const Text("Edit Data"),
            onTap: () => Get.to(const EditData()),
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text("Delete Data"),
            onTap: () => Get.to(const DeleteData()),
          ),
          const Divider(thickness: 1),
          ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Sign Out"),
              onTap: () {
                try {
                  fauth
                      .signOut()
                      .then((value) => Get.offAll(const SplashScreen()));
                } catch (e) {
                  rethrow;
                }
              })
        ],
      ),
    );
  }
}
