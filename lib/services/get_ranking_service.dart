import 'dart:convert';

import 'package:mobile_shower/models/login.dart';
import 'package:mobile_shower/models/ranking.dart';
import 'package:mobile_shower/services/api.dart';
import 'package:http/http.dart' as http;

class GetRankingService {
  Future<List<Ranking>> execute() async {
    try {
      var response = await http.Client().get(
        Api.url + '/rankings',
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode != 200) {
        return null;
      }

      List<Ranking> list = (json.decode(response.body) as List)
          .map((i) => Ranking.fromJson(i))
          .toList();

      return list;

    } catch (err) {
      print(err);
    }

    return null;

  }
}
