import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide_admin/authenticatation/login.dart';
import 'package:travel_guide_admin/screens/account.dart';
import 'package:travel_guide_admin/screens/delete.dart';
import 'package:travel_guide_admin/screens/selec_what_to_add.dart';
import 'package:travel_guide_admin/screens/total_users.dart';
import 'package:travel_guide_admin/screens/view_data.dart';

import '../global/global.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final ref =
      FirebaseDatabase.instance.ref().child("tour_places").child("hotel");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
            Icons.logout,
            color: Colors.white,
      ),
      onPressed: () async {
                  try {
                    await fauth
                        .signOut()
                        .then((value) => Get.offAll(const LoginPage()));
                  } catch (e) {
                    rethrow;
                  }
                },
    )
  ],
          
      ),
      body: ListView(
        children: [
          const SizedBox(height: 5),
          InkWell(
            onTap: () => Get.to(const TotalUsers()),
            child: SizedBox(
              height: 190,
              width: MediaQuery.of(context).size.width * .96,
              child: Card(
                margin: const EdgeInsets.all(10),
                color: Colors.green.shade200,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(height: 20),
                    Icon(
                      Icons.verified_user_sharp,
                      size: 60,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Total Users",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customBtn(
                btnText: "Add New Data",
                btnIcon: const Icon(
                  Icons.add,
                  size: 50,
                ),
                ontap: () => Get.to(const SelectWhatToAdd()),
              ),
              customBtn(
                btnText: "View Data",
                btnIcon: const Icon(
                  Icons.visibility,
                  size: 50,
                ),
                ontap: () => Get.to(const ViewData()),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customBtn(
                btnText: "Delete Data",
                btnIcon: const Icon(
                  Icons.delete,
                  size: 50,
                ),
                ontap: () => Get.to(const DeleteData()),
              ),
              customBtn(
                ontap: () => Get.to(const Account()),
                btnText: "Account",
                btnIcon: const Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget customBtn({btnText, btnIcon, ontap}) {
    return InkWell(
      onTap: ontap,
      child: SizedBox(
        height: 230,
        width: MediaQuery.of(context).size.width * .48,
        child: Card(
          margin: const EdgeInsets.all(10),
          color: Colors.green.shade200,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              btnIcon,
              const SizedBox(height: 10),
              Text(
                btnText,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
