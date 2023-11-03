import 'dart:convert';

import 'package:http/http.dart' as http;

import '../url_services.dart';
Future fetchCreateInvoiceRequest() async {
  try {
    final url = Uri.parse(APIServices.createInvoiceUrl);
    final http.Response response =
    await http.get(url, headers: headerWithTokens);
    final responseBody = jsonDecode(response.body);
    if (response.statusCode == 200 && responseBody['msg'] == 'success') {
      final List<Map<String, dynamic>> data =
      List<Map<String, dynamic>>.from(responseBody['data']);
         print(data);
      return data;
    } else {
      return  [];
    }
  } catch (e) {
    throw Exception('Error has occurred: $e');
  }
}
