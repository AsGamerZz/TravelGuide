import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide/authentication/user_option.dart';
import 'package:travel_guide/controller/controller_methods.dart';
import 'package:travel_guide/global/global.dart';
import 'package:travel_guide/screens/home.dart';

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
      if (fauth.currentUser != null) {
        currentFirebaseUser = fauth.currentUser;
        ControllerMethods.readProfileData();
        Get.offAll(const Home());
      } else {
        Get.offAll(const UserOption());
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
