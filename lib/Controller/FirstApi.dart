import 'dart:convert' as convert;

import 'package:firebase/Model/Second.dart';
import 'package:http/http.dart' as http;
import 'package:firebase/Model/Model.dart';
import 'package:eosdart/eosdart.dart' as eos;
import 'package:firebase/Model/Second.dart';

class ApiClass {
  //var idUrl = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=mar';
  Future<Autogenerate> getprofile() async {
    final response = await http.get(Uri.parse(
        'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=mar'));
    Map<String, dynamic> listofdatafromapi = convert.jsonDecode(response.body);
//  print(decodeddata);
//  print(listofdatafromapi['problems']);
    final details = Autogenerate.fromJson(listofdatafromapi);
// print(details.problems![0].diabetes![0].medications![0].medicationsClasses![0].className![0].associatedDrug![0].name);
    return details;
  }
}
