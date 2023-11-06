import 'dart:convert';

import 'package:http/http.dart' as http;

import '../url_services.dart';

Future fetchBrandProductRequest() async {
  try {
    final Uri uri = Uri.parse(APIServices.brandListUrl);
    final http.Response response = await http.get(uri);
    final Map<String, dynamic> responseBody = jsonDecode(response.body);
    if (response.statusCode == 200 && responseBody['msg'] == 'success') {
      final List<Map<String, dynamic>> data =
      List<Map<String, dynamic>>.from(responseBody['data']);
      return data;
    }  else{
      return [];
    }
  } catch (e) {
    throw Exception('An error occurred: $e');
  }
}
