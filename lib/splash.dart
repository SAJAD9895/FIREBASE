// ignore_for_file: camel_case_types

import 'package:firebase/login_or_signup.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:firebase/google_signin.dart';
import 'package:firebase/login_or_signup.dart';
import 'package:firebase/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase/authentication_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase/after_login.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Image.asset(
              "assets/splash.gif",
              height: 200,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }

  void startTimer() {
    Timer(Duration(seconds: 5), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }

  void navigateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? false;

    if (status == true) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => afterlogin()));
      // Navigation.pushReplacement(context, "/Home");
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Home()));
    }
  }
}

// class splashscreen extends StatefulWidget {
//   const splashscreen({Key? key}) : super(key: key);

//   @override
//   State<splashscreen> createState() => _splashscreenState();
// }

// class _splashscreenState extends State<splashscreen> {
//   @override
//   void initState() {
//     super.initState();

//     Timer(
//         const Duration(seconds: 2),
//         () => Navigator.of(context).pushReplacement(MaterialPageRoute(
//             builder: (BuildContext context) => const Home())));
//   }

//   @override
//   Widget build(BuildContext context) {
//     // ignore: prefer_const_constructors
//     return Scaffold(
//         backgroundColor: Colors.black,
//         body: Container(
//           height: double.infinity,
//           width: double.infinity,
//           color: Color.fromARGB(255, 247, 196, 225),
//           child: const FlutterLogo(),
//         ));
//   }
// }
