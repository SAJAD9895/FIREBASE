import 'dart:async';

import 'package:firebase/Model/Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase/Controller/FirstApi.dart';
import 'dart:developer';

// ignore: camel_case_types
class DataProvider with ChangeNotifier {
  ApiClass apiClass = ApiClass();
  int currentUser = 1;

  late Future<Autogenerate> listdata = apiClass.getprofile();
  
  updateCurrentUser(context, id) {
    currentUser = id;

    notifyListeners();
  }
  

}
