

import 'dart:convert';

import 'package:crafty_bay_ecommerce/data/services/url_services.dart';
import 'package:http/http.dart' as http;

Future postCreateProductByReviewRequest(data) async {
  try {
    final url = Uri.parse('$createProductReviewUrl');
    final http.Response response = await http.post(url,body: data,headers: headerWithTokens);
    final responseBody = jsonDecode(response.body);
    if (response.statusCode == 200 && responseBody['msg'] == 'success') {
      final List<Map<String, dynamic>> data =
      List<Map<String, dynamic>>.from(responseBody['data']);
      return data;
    } else {
      return  [];
    }
  } catch (e) {
    throw Exception('Error has occurred: $e');
  }
}
