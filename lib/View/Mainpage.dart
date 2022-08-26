import 'package:firebase/Controller/FirstProvider.dart';
import 'package:firebase/Model/Second.dart';
import 'package:firebase/View/eg.dart';
import 'package:firebase/View/login.dart';
import 'package:firebase/after_login.dart';
import 'package:firebase/google_signin.dart';
import 'package:firebase/View/login.dart';
import 'package:firebase/View/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_greetings/flutter_greetings.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _emailController = TextEditingController();
  var username = LogIn();

//   void initstate(){
// super.initState();

//   }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          YonoGreetings.showGreetings(),
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 46, 36, 4),
      body: FutureBuilder<List>(
          future: context.read<DataProvider>().datalist,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Color.fromARGB(255, 124, 174, 206),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        child: Card(
                          child: Column(
                            children: [
                              Text('123'
                                // snapshot.data![index].Drinks.strDrink ?? '',
                              ),
                            ],
                          ),
                          color: Colors.redAccent,
                        ),
                      );
                    }),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    ));
  }
}
