import 'dart:convert';

import 'package:mobile_shower/models/shower_register.dart';
import 'package:mobile_shower/models/user.dart';
import 'package:mobile_shower/services/api.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegisterShowerService {
  execute(ShowerRegister showerRegister) async {

    final shared = await SharedPreferences.getInstance();
    final id = shared.getInt('id');

    var response = await http.Client().post(
        Api.url + '/shower-registers/user/$id',
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(showerRegister.toJson())
    );

    if(response.statusCode != 201) {
      throw(jsonDecode(response.body));
    }

    return true;

  }
}
