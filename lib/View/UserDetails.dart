import 'package:firebase/Controller/FirstProvider.dart';
import 'package:firebase/Model/Model.dart';
import 'package:firebase/View/Mainpage.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_greetings/flutter_greetings.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class User1 extends StatefulWidget {
  const User1({Key? key}) : super(key: key);

  @override
  State<User1> createState() => _UserState();
}

class _UserState extends State<User1> {
  List<YoutubePlayerController> lYTC = [];

  Map<String, dynamic> cStates = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 248, 246, 246),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MainPage())),
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text('All Details'),
        ),
        body: FutureBuilder<Autogenerate>(
            future: context.read<DataProvider>().listdata,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    padding: const EdgeInsets.all(0),
                    children: [
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              snapshot
                                      .data!
                                      .drinks![context
                                          .read<DataProvider>()
                                          .currentUser]
                                      .strDrink ??
                                  "",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.album_outlined),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              snapshot
                                      .data!
                                      .drinks![context
                                          .read<DataProvider>()
                                          .currentUser]
                                      .strTags ??
                                  "",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.album_outlined),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              snapshot
                                      .data!
                                      .drinks![context
                                          .read<DataProvider>()
                                          .currentUser]
                                      .strCategory ??
                                  "",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.album_outlined),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              snapshot
                                      .data!
                                      .drinks![context
                                          .read<DataProvider>()
                                          .currentUser]
                                      .strIBA ??
                                  "",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.album_outlined),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              snapshot
                                      .data!
                                      .drinks![context
                                          .read<DataProvider>()
                                          .currentUser]
                                      .strAlcoholic ??
                                  "",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.album_outlined),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              snapshot
                                      .data!
                                      .drinks![context
                                          .read<DataProvider>()
                                          .currentUser]
                                      .strGlass ??
                                  "",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.album_outlined),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 300,
                              child: Text(
                                snapshot
                                        .data!
                                        .drinks![context
                                            .read<DataProvider>()
                                            .currentUser]
                                        .strInstructions ??
                                    "",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.album_outlined),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              snapshot
                                      .data!
                                      .drinks![context
                                          .read<DataProvider>()
                                          .currentUser]
                                      .strInstructionsES ??
                                  "",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.album_outlined),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 300,
                              child: Text(
                                snapshot
                                        .data!
                                        .drinks![context
                                            .read<DataProvider>()
                                            .currentUser]
                                        .strDrinkThumb ??
                                    "",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.album_outlined),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              snapshot
                                      .data!
                                      .drinks![context
                                          .read<DataProvider>()
                                          .currentUser]
                                      .strIngredient1 ??
                                  "",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.album_outlined),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              snapshot
                                      .data!
                                      .drinks![context
                                          .read<DataProvider>()
                                          .currentUser]
                                      .strIngredient2 ??
                                  "",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.album_outlined),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              snapshot
                                      .data!
                                      .drinks![context
                                          .read<DataProvider>()
                                          .currentUser]
                                      .strDrink ??
                                  "",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.album_outlined),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              snapshot
                                      .data!
                                      .drinks![context
                                          .read<DataProvider>()
                                          .currentUser]
                                      .strDrink ??
                                  "",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.album_outlined),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              snapshot
                                      .data!
                                      .drinks![context
                                          .read<DataProvider>()
                                          .currentUser]
                                      .strDrink ??
                                  "",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
