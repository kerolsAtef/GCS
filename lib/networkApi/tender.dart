
import 'dart:developer';
import 'package:gcs_new/search_on_operation/tender_kind_model.dart';
import 'package:gcs_new/utilies/Strings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class TenderApiCaller {
  static Future<dynamic> GetAll(email, password) async {
    String url = "$URL/TenderApp/Tenders";
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


  static Future<dynamic> GetAllPart(email, password) async {
    String url = "$URL/TenderApp/Part";
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

  static Future<List<dynamic>?>GetAllEntities(email, password)async
  {
    String url = "$URL/TenderApp/GetRequestBodies";
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
      return jsonDecode(response.body);
    } else {
      log("Entities"+response.statusCode.toString());
    }
  }

  static Future<List<dynamic>?>GetAllTenderKinds(email, password)async
  {
    String url = "$URL/TenderApp/GetTenderKindValues";
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
      return jsonDecode(response.body);
    } else {
      log("kinds"+response.statusCode.toString());
    }
  }

  static Future<dynamic>filter(email, password,selectedEntityId,startDate,endDate,selectedTenderKind) async {
    String url = "$URL/TenderApp/Filter";
    var headers = {
      "Content-Type": "application/json",
    };
    var body = {
      'UserName' : email,
      'Password' : password,
      'startDate': startDate,
      'endDate': endDate,
      'RequestBodyId': selectedEntityId,
      'TenderKindValue': selectedTenderKind
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

  static Future<List<dynamic>?>GetNotifications(email)async
  {
    String url = "$URL/TenderApp/GetNotifications";
    var headers = {
      "Content-Type": "application/json",
    };
    var body = {
      'UserName': email
    };
    var response = await http.post(
        Uri.parse(url), headers: headers, body: jsonEncode(body));
    if (response.statusCode == 201 || response.statusCode == 204||
        response.statusCode == 204||response.statusCode == 200)
    {
      return jsonDecode(response.body);
    } else {
      log("kinds"+response.statusCode.toString());
    }
  }
}