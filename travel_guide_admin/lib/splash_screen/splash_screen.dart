import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide_admin/Dashboard/dashboard.dart';
import 'package:travel_guide_admin/authenticatation/login.dart';
import 'package:travel_guide_admin/controller/bottom_controller.dart';
import 'package:travel_guide_admin/controller/controller_methods.dart';
import '../global/global.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  navigateToHome() async {
    Timer(const Duration(milliseconds: 4000), () {
      if (fauth.currentUser == null) {
        Get.offAll(const LoginPage());
      } else {
        ControllerMethods.readAdminData();
        Get.offAll(const DashBoard());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/app_logo.png",
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
