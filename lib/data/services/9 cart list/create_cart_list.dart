import 'dart:convert';

import 'package:http/http.dart' as http;

import '../url_services.dart';

Future postCreateCartList(body) async {
  try {
    final url = Uri.parse(createCartListUrl);
    final http.Response response =
        await http.post(url, headers: headerWithTokens, body: body);
    final responseBody = jsonDecode(response.body);
    if (response.statusCode == 200 && responseBody['msg'] == 'success') {
      return responseBody;
    } else {
      return responseBody;
    }
  } catch (e) {
    throw Exception('Error an occurred : $e');
  }
}
