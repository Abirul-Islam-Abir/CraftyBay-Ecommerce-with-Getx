import 'dart:convert';

import 'package:crafty_bay_ecommerce/data/services/url_services.dart';
import 'package:http/http.dart' as http;

Future fetchListProductByReviewRequest(id) async {
  try {
    final url = Uri.parse('${APIServices.listProductByReviewUrl}/$id');
    final http.Response response = await http.get(url);
    final Map<String, dynamic> responseBody = jsonDecode(response.body);
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
