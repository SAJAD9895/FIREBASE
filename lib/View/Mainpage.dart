import 'package:firebase/Controller/FirstProvider.dart';
import 'package:firebase/Model/Model.dart';

import 'package:firebase/View/UserDetails.dart';

import 'package:firebase/View/login.dart';

import 'package:flutter/material.dart';

import 'package:flutter_greetings/flutter_greetings.dart';
import 'package:provider/provider.dart';
import 'package:firebase/View/UserDetails.dart';

import '../Controller/FirstApi.dart';
import '../Model/Model.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _emailController = TextEditingController();
  var username = LogIn();
  // ApiClass apiClass = ApiClass();
  //final List _id = [];

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, provider, child) {
      return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 246, 244, 244),
          elevation: 0,
          title: Text(
            YonoGreetings.showGreetings(),
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 253, 252, 252),
        body: FutureBuilder<Autogenerate>(
            future: context.read<DataProvider>().listdata,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromARGB(255, 250, 252, 253),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      scrollDirection: Axis.vertical,
                      itemCount: 20,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          child: GestureDetector(
                            onTap: () {
                              context
                                  .read<DataProvider>()
                                  .updateCurrentUser(context, index);
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const User1(),
                              ));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data!.drinks![index].idDrink ?? '',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    snapshot.data!.drinks![index].strDrink ??
                                        '',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    snapshot.data!.drinks![index].strTags ?? '',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    snapshot.data!.drinks![index].strCategory ??
                                        '',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    snapshot.data!.drinks![index].strIBA ?? '',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              color: Colors.redAccent,
                            ),
                          ),
                        );
                      }),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ));
    });
  }
}
