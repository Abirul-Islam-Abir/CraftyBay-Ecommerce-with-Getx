import 'dart:convert';

import 'package:http/http.dart' as http;

Future fetchListProductByRemarkRequest(statusUrl) async {
  try {
    final url = Uri.parse(statusUrl);
    final http.Response response = await http.get(url);
    final Map<String, dynamic> responseBody = jsonDecode(response.body);
    if (response.statusCode == 200 && responseBody['msg'] == 'success') {
      final List<Map<String, dynamic>> data =
      List<Map<String, dynamic>>.from(responseBody['data']);
      return data;
    }  else{
      return [];
    }
  } catch (e) {
    throw Exception('Error has occurred: $e');
  }
}
