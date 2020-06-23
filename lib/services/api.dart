import 'package:http/http.dart' as http;

class Api {
  static const url = 'http://192.168.0.16:8080';

  var client = http.Client();
}
