import 'dart:convert';

import 'package:http/http.dart' as http;

import '../url_services.dart';

Future fetchProductWishList() async {
  try {
    final url = Uri.parse(APIServices.productWishListUrl);
    final http.Response response =
        await http.get(url, headers: headerWithTokens);
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      if (responseBody['msg'] == 'success') {
        final data = List<Map<String, dynamic>>.from(responseBody['data']);
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
