// // ignore_for_file: camel_case_types, avoid_unnecessary_containers
// // ignore_for_file: prefer_const_constructors
// // import 'dart:convert';

// import 'package:api/controller/apicall.dart';
// import 'package:api/provider.dart';
// // import 'package:api/provider.dart';
// import 'package:flutter/material.dart';

// import 'package:api/user.dart';
// // import 'package:api/modelclass.dart';
// // ignore: unused_import
// import 'package:provider/provider.dart';

// class home extends StatefulWidget {
//   const home({Key? key}) : super(key: key);

//   @override
//   State<home> createState() => _homeState();
// }

// class _homeState extends State<home> {
//   //final List _id = [];
//   ApiClass apiClass = ApiClass();

//   @override
//   Widget build(BuildContext context) {
//     // ignore: unused_local_variable
//     var size = MediaQuery.of(context).size;
//     return Consumer(builder: (context, provider, child) {
//       return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: const Text('TODO APP'),
//           leading: IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.arrow_back_ios_new,
//               size: 20,
//               color: Color.fromARGB(255, 214, 23, 23),
//             ),
//           ),
//         ),
//         body: FutureBuilder<List>(
//             future: context.read<DataProvider>().datalist,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Container(
//                   height: MediaQuery.of(context).size.height,
//                   width: MediaQuery.of(context).size.width,
//                   color: Colors.white,
//                   child: GridView.builder(
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2),
//                       scrollDirection: Axis.vertical,
//                       itemCount: snapshot.data?.length,
//                       itemBuilder: (BuildContext context, index) {
//                         return Container(
//                           child: Card(
//                             child: Column(
//                               children: [
//                                 GestureDetector(
//                                     onTap: () async {
//                                       context
//                                           .read<DataProvider>()
//                                           .updateCurrentUser(context, index);
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) => Profile(

//                                                 // idOfEmployee: _id,
//                                                 // ID: _id[index].id - 1,
//                                                 ),
//                                           ));
//                                     },
//                                     child: Container(
//                                         padding: const EdgeInsets.all(15),
//                                         child: CircleAvatar(
//                                             radius: 52.0,
//                                             backgroundColor: Colors.white,
//                                             child: CircleAvatar(
//                                               radius: 50.0,
//                                               backgroundImage: NetworkImage(
//                                                 snapshot.data![index]
//                                                         .profileImage ??
//                                                     "null",
//                                                 // _id[index].profileImage ?? "null",
//                                               ),
//                                             )))),
//                                 GestureDetector(
//                                   child: Text(
//                                     snapshot.data![index].name ?? '',
//                                     // _id[index].name,
//                                     style: TextStyle(
//                                         color: Colors.black, fontSize: 20),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             color: Colors.redAccent,
//                           ),
//                         );
//                       }),
//                 );
//               } else {
//                 return Center(child: CircularProgressIndicator());
//               }
//             }),
//       );
//     });
//   }
// }

// // class DataProvider {
// }