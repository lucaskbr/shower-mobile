import 'dart:convert';

import 'package:mobile_shower/models/login.dart';
import 'package:mobile_shower/models/shower_register.dart';
import 'package:mobile_shower/services/api.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetShowerRegistersService {
  Future<List<ShowerRegister>> execute() async {
    try {

      final shared = await SharedPreferences.getInstance();
      final id = shared.getInt('id');

      var response = await http.Client().get(
        Api.url + '/shower-registers/user/$id',
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode != 200) {
        return List<ShowerRegister>();
      }

      List<ShowerRegister> list = (json.decode(response.body) as List)
          .map((i) => ShowerRegister.fromJson(i))
          .toList();

      return list;

    } catch (err) {
      print(err);
    }

    return null;

  }
}
