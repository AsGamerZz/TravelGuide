import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide/authentication/user_option.dart';
import 'package:travel_guide/global/global.dart';
import 'package:travel_guide/screens/change_pass.dart';
import 'package:travel_guide/screens/edit_profile.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 1,
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.green,
              ),
              title: Text(
                "Account",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              horizontalTitleGap: 0,
            ),
            const Divider(
              height: 10,
              thickness: 3,
              color: Colors.black,
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            // ListTile(
            //   leading: const Icon(Icons.key_outlined),
            //   title: const Text(
            //     "Change Password",
            //     style: TextStyle(color: Colors.green, fontSize: 17),
            //   ),
            //   onTap: () {
            //     // Get.to(const ChangePassword(),);
            //   },
            //   trailing: const Icon(Icons.navigate_next),
            //   horizontalTitleGap: 0,
            // ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(
                "Edit Profile",
                style: TextStyle(color: Colors.green, fontSize: 17),
              ),
              trailing: const Icon(Icons.navigate_next),
              horizontalTitleGap: 0,
              onTap: () => Get.to(const EditProfile()),
            ),
            // const ListTile(
            //   leading: Icon(Icons.star_border),
            //   title: Text(
            //     "Favourites",
            //     style: TextStyle(color: Colors.green, fontSize: 17),
            //   ),
            //   trailing: Icon(Icons.navigate_next),
            //   horizontalTitleGap: 0,
            // ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              height: 10,
              thickness: 3,
              color: Colors.black,
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox(
              height: 8,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    fixedSize: const Size(150, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    side: const BorderSide(color: Colors.black)),
                onPressed: () async {
                  try {
                    await fauth
                        .signOut()
                        .then((value) => Get.offAll(const UserOption()));
                  } catch (e) {
                    rethrow;
                  }
                },
                child: Text("SIGN OUT",
                    style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 2.2,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade700)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  // GestureDetector buildAccountOptionRow(BuildContext context, String title) {
  //   return GestureDetector(
  //     onTap: () {
  //       showDialog(
  //           context: context,
  //           builder: (BuildContext context) {
  //             return AlertDialog(
  //               title: Text(title),
  //               content: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   const Text("Option 1"),
  //                   const Text("Option 2"),
  //                   const Text("Option 3"),
  //                 ],
  //               ),
  //               actions: [
  //                 FlatButton(
  //                     onPressed: () {
  //                       Navigator.of(context).pop();
  //                     },
  //                     child: const Text("Close")),
  //               ],
  //             );
  //           });
  //     },
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(vertical: 8.0),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text(
  //             title,
  //             style: TextStyle(
  //               fontSize: 18,
  //               fontWeight: FontWeight.w500,
  //               color: Colors.green[600],
  //             ),
  //           ),
  //           const Icon(
  //             Icons.arrow_forward_ios,
  //             color: Colors.grey,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
