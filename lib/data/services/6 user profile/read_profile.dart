import 'dart:convert';

import 'package:http/http.dart' as http;

import '../url_services.dart';

Future<Map<String, dynamic>?> readProfileRequest() async {
  try {
    final url = Uri.parse(APIServices.readProfileUrl);
    final http.Response response = await http.get(url, headers: headerWithTokens);
    final  responseBody = jsonDecode(response.body);
    if (response.statusCode == 200 && responseBody['msg'] == 'success') {
    final  Map<String, dynamic> data =  Map<String, dynamic>.from(responseBody['data']);
      return  data;
    } else {
       return  {};
    }
  } catch (e) {
    throw Exception('Error has occurred: $e');
  }
}