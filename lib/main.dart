// ignore_for_file: prefer_const_constructors, unused_import, avoid_print

import 'package:firebase/after_login.dart';
import 'package:firebase/View/signup.dart';

import 'package:flutter/material.dart';
import 'package:firebase/View/login_or_signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'View/firebase_options.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase/View/login_or_signup.dart';
import 'package:provider/provider.dart';
import 'package:firebase/Controller/FirstProvider.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => DataProvider(),)],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),));
  //runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Home()));
}
