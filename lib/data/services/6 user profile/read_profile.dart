import 'dart:convert';

import 'package:http/http.dart' as http;

import '../url_services.dart';

Future<Map<String, dynamic>?> readProfileRequest() async {
  try {
    final url = Uri.parse(APIServices.readProfileUrl);
    final http.Response response = await http.get(url, headers: headerWithTokens);
    final responseBody = jsonDecode(response.body);
    if (response.statusCode == 200 && responseBody['msg'] == 'success') {
      print(responseBody);
      return Map<String, dynamic>.from(responseBody['data']);
    } else {
      throw Exception('Failed to fetch profile: ${responseBody['msg']}');
    }
  } catch (e) {
    throw Exception('Error has occurred: $e');
  }
}