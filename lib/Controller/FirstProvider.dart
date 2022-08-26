import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:firebase/Controller/FirstApi.dart';

// ignore: camel_case_types
class DataProvider with ChangeNotifier {
  ApiClass apiClass = ApiClass();
  int currentUser = 1;

  late var datalist = apiClass.getprofile();
 
  updateCurrentUser(context, id) {
    currentUser = id;

    notifyListeners();
  }
}
