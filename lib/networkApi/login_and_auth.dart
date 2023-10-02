
import 'dart:developer';

import 'package:gcs_new/utilies/Strings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class UserApiCaller {
  static Future<dynamic> login(email, password) async {
    String url = "$URL/TenderApp/login";
    var headers = {
      "Content-Type": "application/json",
    };
    var body = {
      'UserName': email,
      'Password': password
    };
    var response = await http.post(
        Uri.parse(url), headers: headers, body: jsonEncode(body));
    if (response.statusCode == 201 || response.statusCode == 204||
        response.statusCode == 204||response.statusCode == 200)
    {
      log(response.body);
      return jsonDecode(response.body);
    } else {
      log(response.statusCode.toString());
    }
  }
}