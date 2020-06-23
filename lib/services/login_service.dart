import 'dart:convert';

import 'package:mobile_shower/models/login.dart';
import 'package:mobile_shower/models/user.dart';
import 'package:mobile_shower/services/api.dart';
import 'package:http/http.dart' as http;

class LoginService {
  execute(Login login) async {

    var response = await http.Client().post(
        Api.url + '/auth/login',
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(login)
    );

    print(jsonDecode(response.body));

    if(response.statusCode > 204) {
      throw(jsonDecode(response.body));
    }

    return User.fromJson(jsonDecode(response.body));

  }
}
