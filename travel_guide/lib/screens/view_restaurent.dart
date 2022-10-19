import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide/global/global.dart';
import 'package:travel_guide/model/restaurent_model.dart';
import 'home_page_detail.dart';

class ViewRestaurents extends StatefulWidget {
  const ViewRestaurents({Key? key}) : super(key: key);

  @override
  State<ViewRestaurents> createState() => _ViewRestaurentsState();
}

class _ViewRestaurentsState extends State<ViewRestaurents> {
  final ref =
      FirebaseDatabase.instance.ref().child("tour_places").child("restaurent");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Restaurents"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: StreamBuilder(
          stream: ref.orderByChild("restaurentcity").equalTo(cityName).onValue,
          builder:
              (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
            if (snapshot.hasData) {
              Map map = snapshot.data!.snapshot.value as Map;
              restaurents.clear();

              map.forEach((dynamic, v) => restaurents.add(RestaurentModel(
                    id: v["id"],
                    restaurentcity: v["restaurentcity"],
                    restaurentname: v["restaurentname"],
                    restaurentlocation: v["restaurentlocation"],
                    restaurentdescription: v["restaurentdescription"],
                    image: v["imageURL"],
                    lat: v["restaurantlatitude"],
                    lng: v["restaurantlongitude"],
                  )));

              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: restaurents.length,
                padding: const EdgeInsets.all(8),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(HomePageDetail(
                        name: restaurents[index].restaurentname,
                        desc: restaurents[index].restaurentdescription,
                        location: restaurents[index].restaurentlocation,
                        image: restaurents[index].image,
                        latitude: restaurents[index].lat,
                        longitude: restaurents[index].lng,
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
                            image: NetworkImage(restaurents[index].image),
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
                                    restaurents[index].restaurentname,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    restaurents[index].restaurentcity,
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
