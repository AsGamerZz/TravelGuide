import 'package:flutter/material.dart';
import 'package:travel_guide/global/global.dart';

class CityHistory extends StatefulWidget {
  const CityHistory({Key? key}) : super(key: key);

  @override
  State<CityHistory> createState() => _CityHistoryState();
}

class _CityHistoryState extends State<CityHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cityName + " History"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Image.asset(
              history[cityName]["image"].toString(),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(14),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Text(
                  history[cityName]["cityHistory"].toString(),
                  maxLines: 300,
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
