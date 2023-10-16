import 'dart:convert';

import 'package:http/http.dart' as http;

import '../base_url.dart';

Future postDeleteCartList(id) async {
  try {
    final url = Uri.parse('$deleteCartListUrl/$id');
    final http.Response response =
        await http.get(url, headers: headerWithTokens);
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      if (responseBody['msg'] == 'success') {
        return responseBody;
      } else {
        throw Exception('Error has occurred: ${responseBody['msg']}');
      }
    } else {
      throw Exception('Error has occurred: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error has occurred: $e');
  }
}
