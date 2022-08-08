
// import 'package:firebase/login_or_signup.dart';
// import 'package:firebase/signup.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase/authentication_service.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'firebase_options.dart';
// import 'dart:async';
// class MyApp extends StatefulWidget {
//   // This widget is the root of your application.

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late StreamSubscription<User?> user;
//   void initState() {
//     super.initState();
//     user = FirebaseAuth.instance.authStateChanges().listen((user) {
//       if (user == null) {
//         print('User is currently signed out!');
//       } else {
//         print('User is signed in!');
//       }
//     });
//   }

//   @override
//   void dispose() {
//     user.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       /// check if user is signed (Open Chat page ) if user is not signed in (open welcome page)
//       initialRoute:
//           FirebaseAuth.instance.currentUser == null ? Welcome.id : ChatApp.id,

//       ///key value pair
//       routes: {
//         Welcome.id: (context) => Welcome(),
//         Login.id: (context) => Login(),
//         Registration.id: (context) => Registration(),
//         ChatApp.id: (context) => ChatApp(),
//       },
//       home: Welcome(),
//     );
//   }
// }