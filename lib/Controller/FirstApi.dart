import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:firebase/Model/Model.dart';

class ApiClass {
  var idUrl = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=mar';
  Future<List> getprofile() async {
    http.Response res = await http.get(Uri.parse(idUrl));
    try {
      if (res.statusCode == 200) {
        List pro = json.decode(res.body);

        return pro.map((e) => Autogenerated.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
  