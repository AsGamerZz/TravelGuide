import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide/global/global.dart';
import 'package:travel_guide/model/place_model.dart';
import 'package:travel_guide/screens/home_page_detail.dart';

class ViewPlaces extends StatefulWidget {
  const ViewPlaces({Key? key}) : super(key: key);

  @override
  State<ViewPlaces> createState() => _ViewPlacesState();
}

class _ViewPlacesState extends State<ViewPlaces> {
  final ref =
      FirebaseDatabase.instance.ref().child("tour_places").child("places");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Places"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: StreamBuilder(
          stream: ref.orderByChild("placecity").equalTo(cityName).onValue,
          builder:
              (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
            if (snapshot.hasData) {
              Map map = snapshot.data!.snapshot.value as Map;
              places.clear();

              map.forEach((dynamic, v) => places.add(PlaceModel(
                    id: v["id"],
                    placecity: v["placecity"],
                    placename: v["placename"],
                    placelocation: v["placelocation"],
                    placedescription: v["placedescription"],
                    image: v["imageURL"],
                    lat: v['placelatitude'],
                    lng: v['placelongitude'],
                  )));

              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: places.length,
                padding: const EdgeInsets.all(8),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(HomePageDetail(
                        name: places[index].placename,
                        desc: places[index].placedescription,
                        location: places[index].placelocation,
                        image: places[index].image,
                        latitude: places[index].lat,
                        longitude: places[index].lng,
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
                            image: NetworkImage(places[index].image.toString()),
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
                                    places[index].placename,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    places[index].placecity,
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
