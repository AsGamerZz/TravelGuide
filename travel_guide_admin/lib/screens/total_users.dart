import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class TotalUsers extends StatefulWidget {
  const TotalUsers({Key? key}) : super(key: key);

  @override
  State<TotalUsers> createState() => _TotalUsersState();
}

class _TotalUsersState extends State<TotalUsers> {
  final ref = FirebaseDatabase.instance.ref().child("customers");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Total Users"),
        centerTitle: true,
      ),
      body: FirebaseAnimatedList(
        query: ref,
        itemBuilder: (context, snap, animation, index) {
          Map list = snap.value as Map;
          if (snap.value != null) {
            if (list["city"] != "") {
              return Card(
                margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          listTile(
                            text: list["id"],
                            icon: const Icon(Icons.verified_user),
                          ),
                          listTile(
                            text: list["name"],
                            icon: const Icon(Icons.person),
                          ),
                          listTile(
                            text: list["email"],
                            icon: const Icon(Icons.email),
                          ),
                          listTile(
                            text: list["city"],
                            icon: const Icon(Icons.location_city),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container();
            }
          }
          return Container();
        },
      ),
    );
  }

  Widget listTile({text, icon}) {
    return ListTile(
      leading: icon,
      title: Text(text),
      horizontalTitleGap: 0,
    );
  }
}
