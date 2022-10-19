// // ignore_for_file: dead_code

// import 'package:flutter/material.dart';

// class ChangePassword extends StatelessWidget {
//   const ChangePassword({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//         backgroundColor: Colors.white38,
//         elevation: 5,
//         // centerTitle: false,
//         iconTheme: const  IconThemeData(color: Colors.green),
//       );

//       GestureDetector(
        

//         // close keyboard on outside input tap
//         onTap: () {
//           FocusScope.of(context).requestFocus(FocusNode());
//         },

//         child: Builder(
//           builder: (context) => ListView(
//             padding: const EdgeInsets.all(20),
//             children: <Widget> [

//               // header text
//               const Text('Reset Password', style: TextStyle(fontStyle: FontStyle.italic) ),
//               const Text('Deco UI Kit', ),

//               // password input
//               Padding(
//                 padding: EdgeInsets.only(top: 48.0),
//                 child: InputField(
//                   text: 'New Password',
//                   obscureText: true,
//                   password: true
//                 ),
//               ),

//               // password input
//               Padding(
//                 padding: EdgeInsets.only(top: 16.0),
//                 child: InputField(
//                   text: 'Repeat Password',
//                   obscureText: true,
//                   password: true
//                 ),
//               ),

//               // submit button
//               Padding(
//                 padding: EdgeInsets.only(top: 16.0),
//                 child: Button(
//                   text: 'Reset Password',

//                   // add your on tap handler here
//                   onTap: () {
//                     Scaffold.of(context).showSnackBar(
//                       SnackBar(content: Text('Tapped on reset password button'))
//                     );
//                   },
//                 ),
//               ),

//               // sign up button
//               Padding(
//                 padding: EdgeInsets.only(top: 16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text('Don\'t have an account?'),
//                     Button(
//                       text: 'Sign Up',
//                       clear: true,
                      
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//       }

  

// }