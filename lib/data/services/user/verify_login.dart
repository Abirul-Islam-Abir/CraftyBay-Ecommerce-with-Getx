import 'dart:convert';
import 'package:http/http.dart' as http;
import '../base_url.dart';

Future verifyLoginRequest({email, otp}) async {
  try {
    final url = Uri.parse('$verifyLoginUrl/$email/$otp');
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
