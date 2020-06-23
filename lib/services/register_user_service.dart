import 'dart:convert';

import 'package:mobile_shower/models/user.dart';
import 'package:mobile_shower/services/api.dart';
import 'package:http/http.dart' as http;

class RegisterUserService {
  execute(User user) async {

    var response = await http.Client().post(
        Api.url + '/users',
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(user)
    );

    if(response.statusCode > 204) {
      throw(jsonDecode(response.body));
    }

    return User.fromJson(jsonDecode(response.body));

  }
}
