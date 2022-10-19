import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide_admin/Dashboard/dashboard.dart';
import 'package:travel_guide_admin/screens/view_routes.dart';
import '../screens/selec_what_to_add.dart';
import '../screens/view_places.dart';
import '../screens/view_restaurent.dart';

class BottomController extends StatefulWidget {
  const BottomController({Key? key}) : super(key: key);

  @override
  State<BottomController> createState() => _BottomControllerState();
}

class _BottomControllerState extends State<BottomController> {
  List<Widget> screens = [
    const DashBoard(),
    const ViewRestaurents(),
    const ViewPlaces(),
    const ViewRoutes(),
  ];

  var scaffoldKey = GlobalKey<ScaffoldState>();

  int currentIndex = 0;

  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.hotel),
      label: "Hotels",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.restaurant),
      label: "Restaurent",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.location_city),
      label: "Places",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.route),
      label: "Routes",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: items,
        currentIndex: currentIndex,
        selectedItemColor: Colors.green[800],
        onTap: (index) => setState(() => currentIndex = index),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(const SelectWhatToAdd()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
