import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Detail extends StatefulWidget {
  Detail({Key? key, this.address, this.city, this.disc, this.name, this.image})
      : super(key: key);

  String? name, city, disc, address, image;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
        centerTitle: true,
        elevation: 2,
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
            Text(widget.name!.toString()),
            const SizedBox(height: 5),
            Text(
              widget.address!.toString(),
              maxLines: 4,
            ),
            const SizedBox(height: 5),
            Text(widget.city.toString()),
            const SizedBox(height: 5),
            Text(
              widget.disc!.toString(),
              maxLines: 14,
            ),
          ],
        ),
      ),
    );
  }
}
