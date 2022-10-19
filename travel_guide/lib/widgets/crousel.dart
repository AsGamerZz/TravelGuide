import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide/global/global.dart';
import '../global/global.dart';

// ignore: must_be_immutable
class CrouselSlide extends StatefulWidget {
  const CrouselSlide({Key? key}) : super(key: key);

  @override
  State<CrouselSlide> createState() => _CrouselSlideState();
}

class _CrouselSlideState extends State<CrouselSlide> {
  final ref =
      FirebaseDatabase.instance.ref().child("tour_places").child("places");
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 200,
          autoPlay: true,
          enableInfiniteScroll: false,
          enlargeCenterPage: true),
      items: [0, 1, 2, 3, 4].map(
        (item) {
          return Builder(
            builder: (BuildContext context) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Stack(
                  children: [
                    Container(
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.greenAccent,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(images[item]),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ).toList(),
    );
  }
}
