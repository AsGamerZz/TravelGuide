// import 'package:flutter/material.dart';
// import 'package:travel_guide_admin/authenticatation/login.dart';
// import 'package:travel_guide_admin/authenticatation/signup.dart';

// class UserOption extends StatelessWidget {
//   const UserOption({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height,
//           padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Column(
//                 children: <Widget>[
//                   const Text(
//                     "Welcome",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 30,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     "TravelGuide Provides alot of recommendation about alot of cities.",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.grey[700],
//                       fontSize: 15,
//                     ),
//                   )
//                 ],
//               ),
//               Container(
//                 height: MediaQuery.of(context).size.height / 3,
//                 decoration: const BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage("assets/images/welcome.png"))),
//               ),
//               Column(
//                 children: <Widget>[
//                   // the login button
//                   MaterialButton(
//                     minWidth: double.infinity,
//                     height: 60,
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const LoginPage()));
//                     },
//                     // defining the shape
//                     shape: RoundedRectangleBorder(
//                         side: const BorderSide(color: Colors.black),
//                         borderRadius: BorderRadius.circular(50)),
//                     child: const Text(
//                       "Login",
//                       style:
//                           TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
//                     ),
//                   ),
//                   // creating the signup button
//                   const SizedBox(height: 20),
//                   MaterialButton(
//                     minWidth: double.infinity,
//                     height: 60,
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const SignupPage()));
//                     },
//                     color: Color.fromARGB(255, 59, 224, 18),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(50)),
//                     child: const Text(
//                       "Sign up",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 18),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
