import 'dart:convert';

import 'package:crafty_bay_ecommerce/data/services/url_services.dart';
import 'package:http/http.dart' as http;

Future fetchListProductByReviewRequest(id) async {
  try {
    final url = Uri.parse('$listProductByReviewUrl/$id');
    final http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      if (responseBody['msg'] == 'success') {
        final List<Map<String, dynamic>> data =
            List<Map<String, dynamic>>.from(responseBody['data']);
        return data;
      } else {
        throw Exception(
            'Error has occurred: ${responseBody['msg'] == 'success'}');
      }
    } else {
      throw Exception('Error has occurred: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error has occurred: $e');
  }
}
