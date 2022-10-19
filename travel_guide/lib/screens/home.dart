import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide/controller/controller_methods.dart';
import 'package:travel_guide/screens/city_history.dart';
import 'package:travel_guide/screens/view_hotel.dart';
import 'package:travel_guide/screens/view_places.dart';
import 'package:travel_guide/screens/view_restaurent.dart';
import 'package:travel_guide/screens/view_routes.dart';
import 'package:travel_guide/widgets/crousel.dart';
import 'package:travel_guide/widgets/my_drawer.dart';
import '../global/global.dart';

class Home extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key);

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? profile;

  loadData() {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    ref.child('tour_places').child("Restaurents");
  }

  @override
  void initState() {
    super.initState();
    loadData();
    ControllerMethods.readProfileData();
  }

  bool customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, //make in center
        elevation: 2, //remove shadow
        title: const Text("TravelGuide"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: const Text(
                'Featured Places of Pakistan',
                style: TextStyle(
                  fontSize: 23,
                  fontFamily: 'Lobster',
                  fontWeight: FontWeight.w400, // FontWeight.bold
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const CrouselSlide(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ExpansionTile(
                leading: const Icon(Icons.location_city),
                title: Text(
                  cityName,
                  style: const TextStyle(
                    fontSize: 19,
                  ),
                ),
                children: [
                  ListTile(
                    title: const Text('Multan'),
                    onTap: () {
                      setState(() {
                        cityName = "Multan";
                      });
                    },
                  ),
                  ListTile(
                    title: const Text('Lahore'),
                    onTap: () {
                      setState(() {
                        cityName = "Lahore";
                      });
                    },
                  ),
                  ListTile(
                    title: const Text('Karachi'),
                    onTap: () {
                      setState(() {
                        cityName = "Karachi";
                      });
                    },
                  ),
                  ListTile(
                    title: const Text('Peshawar'),
                    onTap: () {
                      setState(() {
                        cityName = "Peshawar";
                      });
                    },
                  ),
                  ListTile(
                    title: const Text('Islamabad'),
                    onTap: () {
                      setState(() {
                        cityName = "Islamabad";
                      });
                    },
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 2,
              indent: 30,
              endIndent: 30,
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customBtn(
                        btnText: "Places to Visit",
                        btnIcon: const Icon(
                          Icons.location_city,
                          size: 60,
                        ),
                        ontap: () => Get.to(const ViewPlaces())),
                    customBtn(
                        btnText: "Hotels for Rest",
                        btnIcon: const Icon(
                          Icons.hotel,
                          size: 60,
                        ),
                        ontap: () => Get.to(const ViewHotels())),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customBtn(
                        btnText: "Restaurents\n  for Meal",
                        btnIcon: const Icon(
                          Icons.restaurant_menu,
                          size: 60,
                        ),
                        ontap: () => Get.to(const ViewRestaurents())),
                    customBtn(
                      ontap: () => Get.to(const ViewRoutes()),
                      btnText: "Routes",
                      btnIcon: const Icon(
                        Icons.bus_alert,
                        size: 65,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => Get.to(const CityHistory()),
                  child: SizedBox(
                    height: 230,
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
                            Icons.history_edu_outlined,
                            size: 70,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "History of City",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      drawer: const MyDrawer(),
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
