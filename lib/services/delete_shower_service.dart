import 'dart:convert';

import 'package:mobile_shower/models/login.dart';
import 'package:mobile_shower/services/api.dart';
import 'package:http/http.dart' as http;

class DeleteShowerRegisterService {
  execute(int id) async {

    var response = await http.Client().delete(
        Api.url + '/shower-registers/$id',
        headers: {"Content-Type": "application/json"},
    );

    if(response.statusCode > 204) {
      throw(jsonDecode(response.body));
    }

    return true;

  }
}
