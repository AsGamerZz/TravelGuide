import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide/global/global.dart';
import 'package:travel_guide/model/hotel_moel.dart';
import 'package:travel_guide/screens/home_page_detail.dart';

class ViewHotels extends StatefulWidget {
  const ViewHotels({Key? key}) : super(key: key);

  @override
  State<ViewHotels> createState() => _ViewHotelsState();
}

class _ViewHotelsState extends State<ViewHotels> {
  final ref =
      FirebaseDatabase.instance.ref().child("tour_places").child("hotel");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Hotels"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: StreamBuilder(
          stream: ref.orderByChild("hotelcity").equalTo(cityName).onValue,
          builder:
              (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
            if (snapshot.hasData) {
              Map map = snapshot.data!.snapshot.value as Map;
              hotels.clear();
              map.forEach((dynamic, v) => hotels.add(HotelModel(
                    id: v["id"],
                    hotelcity: v["hotelcity"],
                    hotelname: v["hotelname"],
                    hotellocation: v["hotellocation"],
                    hoteldescription: v["hoteldescription"],
                    image: v["imageURL"],
                    lat: v['hotellatitude'],
                    lng: v['hotellongitude'],
                  )));

              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: hotels.length,
                padding: const EdgeInsets.all(8),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(HomePageDetail(
                        name: hotels[index].hotelname,
                        desc: hotels[index].hoteldescription,
                        location: hotels[index].hotellocation,
                        image: hotels[index].image,
                        latitude: hotels[index].lat,
                        longitude: hotels[index].lng,
                      ));
                      print(hotels[index].lat);
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
                            image: NetworkImage(hotels[index].image),
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
                                    hotels[index].hotelname,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    hotels[index].hotelcity,
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
