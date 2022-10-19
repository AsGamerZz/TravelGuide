// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// import '../global/global.dart';

// class Malls extends StatefulWidget {
//   const Malls({Key? key}) : super(key: key);

//   @override
//   State<Malls> createState() => _MallsState();
// }

// class _MallsState extends State<Malls> {
//   final mallsnameController = TextEditingController();
//   final mallslocationController = TextEditingController();
//   final mallsdescriptionController = TextEditingController();
//   final mallscityController = TextEditingController();

//   saveMallData() async {
//     if (fauth.currentUser != null) {
//       Map mallmap = {
//         "mallsname": mallsnameController.text.trim(),
//         "mallslocation": mallslocationController.text.trim(),
//         "mallscity": mallscityController.text.trim(),
//         "mallsdescription": mallsdescriptionController.text.trim(),
//       };

//       DatabaseReference ref = fdb.ref().child("tour_places");
//       ref.child("malls").push().set(mallmap);

//       Fluttertoast.showToast(msg: "Mall Data has been Added.");
//     } else {
//       Fluttertoast.showToast(msg: "Cannot add data right now.");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.green,
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 40),
//           height: MediaQuery.of(context).size.height - 50,
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               const Text(
//                 "Add New Malls",
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Column(
//                 children: <Widget>[
//                   inputFile(
//                       label: "Mall Name", controller: mallsnameController),
//                   inputFile(
//                       label: "Location", controller: mallslocationController),
//                   inputFile(label: "City", controller: mallscityController),
//                   inputFile(
//                     label: "Description",
//                     controller: mallsdescriptionController,
//                     max: 5,
//                   ),
//                 ],
//               ),
//               Container(
//                 padding: const EdgeInsets.only(top: 3, left: 3),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50),
//                     border: const Border(
//                       bottom: BorderSide(color: Colors.black),
//                       top: BorderSide(color: Colors.black),
//                       left: BorderSide(color: Colors.black),
//                       right: BorderSide(color: Colors.black),
//                     )),
//                 child: MaterialButton(
//                   minWidth: 200,
//                   height: 45,
//                   onPressed: () {
//                     saveMallData();
//                   },
//                   color: const Color.fromARGB(255, 59, 224, 18),
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                   child: const Text(
//                     "Add Mall Data",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 18,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // we will be creating a widget for text field
// Widget inputFile({label, obscureText = false, controller, value, max}) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       Text(
//         label,
//         style: const TextStyle(
//             fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
//       ),
//       const SizedBox(
//         height: 5,
//       ),
//       TextField(
//         onChanged: value,
//         controller: controller,
//         obscureText: obscureText,
//         maxLines: max,
//         decoration: const InputDecoration(
//             contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.grey),
//             ),
//             border:
//                 OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
//       ),
//       const SizedBox(
//         height: 10,
//       )
//     ],
//   );
// }
