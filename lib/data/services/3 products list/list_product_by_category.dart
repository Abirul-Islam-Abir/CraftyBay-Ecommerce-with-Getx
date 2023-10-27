import 'dart:convert';

import 'package:crafty_bay_ecommerce/data/services/url_services.dart';
import 'package:http/http.dart' as http;

Future fetchListProductByCategoryRequest(id) async {
  try {
    final url = Uri.parse('$listProductByCategoryUrl/$id');
    final http.Response response = await http.get(url);
    final responseBody = jsonDecode(response.body);
    if (response.statusCode == 200 && responseBody['msg'] == 'success') {
      return responseBody;
    } else {
      return responseBody;
    }
  } catch (e) {
    throw Exception('Error has occurred: $e');
  }
}
