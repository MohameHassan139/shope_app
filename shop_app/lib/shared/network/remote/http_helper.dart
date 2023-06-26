import 'dart:convert';

import 'package:http/http.dart' as http;

class Http {
  static String url = 'https://student.valuxapps.com/api/';

  // static final Map<String, String> headers = {
  //   'Content-Type': 'application/json',
  // };
  // static Future postData({
  //   required String path,
  //   required String email,
  //   required String password,
  // }) async {
  //   Uri uri = Uri.parse('$url$path');
  //   Map map = {"email": email, "password": password}
  //   var body =
  //   var response = await http.post(
  //     uri,
  //     body: {"email": email, "password": password},
  //     // headers: headers
  //   );
  //   if (response.statusCode == 200) {
  //     var jsonResponse = jsonDecode(response.body);
  //     print(jsonResponse);
  //     return jsonResponse;
  //   } else {
  //     throw Exception('Failed to Login.');
  //   }
  // }








  // static Future login({
  //   required String path,
  //   required String email,
  //   required String password,
  // }) async {
  //   Uri uri = Uri.parse('${Http.url}$path');
  //   Map data = {
  //     "email": email,
  //     "password": password,
  //   };
  //   print(data);
  //   String body = json.encode(data);
  //   print(body);
  //   // var url = Uri.parse(Endpoint.login);
  //   var response = await http.post(
  //     uri,
  //     body: body,
  //     headers: {
  //       "Content-Type": "application/json",
  //       "accept": "application/json",
  //       "Access-Control-Allow-Origin": "*"
  //     },
  //   );
  //   print("Http file ${response.body}");
  //   print(response.statusCode);

  //   var jsonResponse = await jsonDecode(response.body);

  //   return jsonResponse;
  //   //Or put here your next screen using Navigator.push() method
  //   print('success');
  // }


  static  login({
    required String path,
    required String email,
    required String password,
  }) async {
    
      Uri uri = Uri.parse('https://student.valuxapps.com/api/login');
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "accept": "application/json",
      };
      Map<String, dynamic> data = {
        "email": email,
        "password": password,
      };
      String body = jsonEncode(data);

      var response = await http.post(uri, headers: headers, body: body);
      
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      
    
  }
}
