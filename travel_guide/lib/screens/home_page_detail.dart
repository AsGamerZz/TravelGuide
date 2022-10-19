import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';

// ignore: must_be_immutable
class HomePageDetail extends StatefulWidget {
  HomePageDetail(
      {Key? key,
      this.city,
      this.location,
      this.desc,
      this.name,
      this.image,
      this.latitude,
      this.longitude})
      : super(key: key);
  String? name, city, location, desc, image;
  double? latitude, longitude;

  @override
  State<HomePageDetail> createState() => _HomePageDetailState();
}

class _HomePageDetailState extends State<HomePageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tour Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.network(widget.image!.toString()),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name!.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.location!.toString(),
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.grey.shade600),
                        maxLines: 4,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.desc!.toString(),
                        maxLines: 35,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MapsLauncher.launchCoordinates(widget.latitude!, widget.longitude!);
        },
        child: const Icon(Icons.location_on),
      ),
    );
  }
}
