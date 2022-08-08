// ignore_for_file: prefer_const_constructors, unused_field, unused_import, unnecessary_null_comparison

import 'package:firebase/after_login.dart';
import 'package:firebase/login_or_signup.dart';
import 'package:firebase/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase/authentication_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'firebase_options.dart';

// import 'package:flutter/foundation.dart' show kIsWeb;

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
          backgroundColor: const Color.fromARGB(255, 254, 250, 250),
          title: const Text(
            'SALES TOP',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(35, 25, 0, 15),
                  child: Text(
                    'Welcome Back!',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(35, 0, 0, 35),
                    child: Text('Log in.....')),
                Padding(
                    padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                    child: Text(' EMAIL')),
                Padding(
                  padding: EdgeInsets.fromLTRB(35, 10, 0, 25),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        // border: InputBorder.none,
                        border: OutlineInputBorder(),
                        labelText: 'Enter yuour email',
                        hintText: 'Enter Your email'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(35, 30, 0, 0),
                  child: Text('password'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(35, 10, 0, 45),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        // border: InputBorder.none,
                        border: OutlineInputBorder(),
                        labelText: 'Enter password',
                        hintText: 'Enter Your passsword'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () async {
                        final message = await AuthService().login(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        // if (_emailController.text == null) {
                        // SharedPreferences prefs =
                        //     await SharedPreferences.getInstance();
                        //   // prefs.setString('email', "useremal@gmail.com");
                        //   var email = prefs.getString('email');
                        //   print(email);
                        // }

                        if (message!.contains('Success')) {
                          // print(email);
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setBool("isLoggedIn", true);
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => afterlogin(),
                            ),
                          );
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(message),
                          ),
                        );
                      },
                      height: 50,
                      minWidth: 200,
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
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("didn't have account"),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: Text(
                              "sign up",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: const CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage('assets/facebook.png'),
                      ),
                    ),
                    Form(
                      child: GestureDetector(
                        onTap: () async {},
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: const CircleAvatar(
                            radius: 18,
                            backgroundImage: AssetImage('assets/gmail.jpg'),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: const CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage('assets/linkdin.png'),
                      ),
                    ),
                  ],
                ),
              ]),
        ));
  }
}
