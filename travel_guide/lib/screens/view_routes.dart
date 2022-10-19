import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide/global/global.dart';
import 'package:travel_guide/model/routes_model.dart';
import 'package:travel_guide/screens/home_page_detail.dart';

class ViewRoutes extends StatefulWidget {
  const ViewRoutes({Key? key}) : super(key: key);

  @override
  State<ViewRoutes> createState() => _ViewRoutesState();
}

class _ViewRoutesState extends State<ViewRoutes> {
  final ref =
      FirebaseDatabase.instance.ref().child("tour_places").child("routes");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Routes"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: StreamBuilder(
          stream: ref.orderByChild("routecity").equalTo(cityName).onValue,
          builder:
              (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
            if (snapshot.hasData) {
              Map map = snapshot.data!.snapshot.value as Map;
              routes.clear();

              map.forEach((dynamic, v) => routes.add(RoutesModel(
                    id: v["id"],
                    routecity: v["routecity"],
                    routename: v["routename"],
                    routelocation: v["routelocation"],
                    routedescription: v["routedescription"],
                    image: v["imageURL"],
                    lat: v["routelatitude"],
                    lng: v["routelongitude"],
                  )));
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: routes.length,
                padding: const EdgeInsets.all(8),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(HomePageDetail(
                        name: routes[index].routename,
                        desc: routes[index].routedescription,
                        location: routes[index].routelocation,
                        image: routes[index].image,
                        latitude: routes[index].lat,
                        longitude: routes[index].lng,
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                          image: DecorationImage(
                            image: NetworkImage(routes[index].image.toString()),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.black,
                                    Color(0x19000000),
                                  ],
                                  begin: FractionalOffset(0.0, 1.0),
                                  end: FractionalOffset(0.0, 0.0),
                                  stops: [0.0, 1.0],
                                  tileMode: TileMode.clamp),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    routes[index].routename,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    routes[index].routecity,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w200,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
