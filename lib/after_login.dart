// ignore_for_file: unused_import, unused_field

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

class afterlogin extends StatelessWidget {
 
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Auth google = Auth();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.account_balance_sharp,
            color: Colors.black,
          ),
          onPressed: () async {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Home()));
          },
        ),
        backgroundColor: const Color.fromARGB(255, 254, 250, 250),
        title: const Text(
          'HOME PAGE',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "login success",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () async {
                await google.signOut(context);
                await _auth.signOut();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Home()));
                SharedPreferences prefs = await SharedPreferences.getInstance();
                // // prefs.remove('email');
                prefs.setBool("isLoggedIn", false);
                try {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const Home()));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.toString()),
                    ),
                  );
                }
              },
              child: const Text('sign out')),

          //save()
        ],
      ),
    );
  }
}
