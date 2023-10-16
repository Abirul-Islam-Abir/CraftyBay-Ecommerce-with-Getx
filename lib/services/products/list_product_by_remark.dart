import 'dart:convert';

import 'package:http/http.dart' as http;

Future fetchListProductByRemarkRequest(statusUrl) async {
  try {
    final url = Uri.parse(statusUrl);
    final http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      if (responseBody['msg'] == 'success') {
        final List<Map<String, dynamic>> data =
            List<Map<String, dynamic>>.from(responseBody['data']);
        return data;
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
