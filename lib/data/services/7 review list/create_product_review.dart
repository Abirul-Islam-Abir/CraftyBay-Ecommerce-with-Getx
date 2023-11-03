

import 'dart:convert';

import 'package:crafty_bay_ecommerce/data/services/url_services.dart';
import 'package:http/http.dart' as http;

Future postCreateProductByReviewRequest(body) async {
  try {
    final url = Uri.parse(APIServices.createProductReviewUrl);
    final http.Response response = await http.post(url,body: jsonEncode(body),headers: headerWithTokens);
    final responseBody = jsonDecode(response.body);
    if (response.statusCode == 200 && responseBody['msg'] == 'success') {

      return responseBody;
    } else {
      return  responseBody;
    }
  } catch (e) {
    throw Exception('Error has occurred: $e');
  }
}
