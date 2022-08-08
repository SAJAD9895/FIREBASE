// ignore_for_file: prefer_const_constructors, unused_import, avoid_print

import 'package:firebase/after_login.dart';
import 'package:firebase/signup.dart';
import 'package:firebase/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase/login_or_signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // var email = prefs.getString('email');
  // //print(email);
  // runApp(MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: email == null ? Home() : afterlogin()));
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()));
}
