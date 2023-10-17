import 'dart:convert';
import 'package:http/http.dart' as http;
import '../base_urls.dart';

Future createProfileRequest(body) async {
  try {
    final url = Uri.parse(createProfileUrl);
    final http.Response response = await http.post(
      url,
      headers: headerWithTokens,
      body: body,
    );
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      if (responseBody['msg'] == 'success') {
        return responseBody;
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
