import 'dart:convert';

import 'package:http/http.dart' as http;

class Service {
  Future<Map<String, dynamic>> getJson(String url) async {
    final response = await http.get(url,
        headers: {'X-CMC_PRO_API_KEY': 'APY_KEY'});
    final responseJson = await json.decode(response.body);

    return responseJson;
  }
}
