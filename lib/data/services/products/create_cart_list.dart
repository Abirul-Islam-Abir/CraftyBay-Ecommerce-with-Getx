import 'dart:convert';

import 'package:http/http.dart' as http;

import '../base_url.dart';

Future postCreateCartList(body) async {
  try {
    final url = Uri.parse(createCartListUrl);
    final http.Response response =
        await http.post(url, headers: headerWithTokens, body: body);
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      if (responseBody['msg'] == 'success') {
        return responseBody;
      } else {
        throw Exception('Request failed!: ${responseBody['msg']}');
      }
    } else {
      throw Exception('Request failed!: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error an occurred : $e');
  }
}
