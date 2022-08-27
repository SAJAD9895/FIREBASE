// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers
// ignore: prefer_const_constructors
import 'package:firebase/View/Mainpage.dart';
import 'package:firebase/View/login.dart';
import 'package:firebase/after_login.dart';
import 'package:firebase/google_signin.dart';

import 'package:firebase/View/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  Auth google = Auth();
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance?.addPostFrameCallback ??
    //     ((timeStamp) {
    //       checkLogin();
    //     });
  }

  checkLogin() async {
    String? token = await google.getToken();
    if (token != null) {
      setState(() {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => afterlogin()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
              child: const Text(
            'Hello!',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w900, fontSize: 30),
          )),

          SizedBox(
            height: 50,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => LogIn()));
              },
              height: 50,
              minWidth: 120,
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            //ElevatedButton(onPressed: () {}, child: Text('sign up'))
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
              },
              height: 50,
              minWidth: 120,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ]),
          // SizedBox(
          //   height: 30,
          // ),
          SizedBox(
            height: 75,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Image.asset(
                        'assets/google.gif',
                        scale: 3,
                      ),
                      onTap: () async {
                        google.googleSignIn(context);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MainPage(),
                        ));
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
