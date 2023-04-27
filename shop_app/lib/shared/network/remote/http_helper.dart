import 'dart:convert';

import 'package:http/http.dart' as http;



class Http {
  
  static String url = 'https://student.valuxapps.com/api/';
  static final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static Future postData({
    required String path,
    required String email,
    required String password,
  }) async {
    Uri uri = Uri.parse('$url$path');
    var response = await http.post(
      uri,
      body: {"email": email, "password": password},
      // headers: headers
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to Login.');
    }
  }
}
