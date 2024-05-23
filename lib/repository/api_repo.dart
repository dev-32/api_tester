import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final apiRepoProvider = Provider((ref) => ApiRepo());

class ApiRepo {
  Future<String> getData(String baseUrl, String endPoint) async {
    final url = Uri.parse(
      baseUrl + endPoint,
    );
    final response =
        await http.get(url, headers: {'Content-Type': 'application/json'});
    log(response.body);
    if(response.statusCode!=200) return 'error';
    return response.body;
  }

  Future<String> postData(String baseUrl, String endPoint, String data) async {
    final url = Uri.parse(
      baseUrl + endPoint,
    );
    print(jsonEncode(data));
    final response = await http.post(url,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    log(response.body);
    if(response.statusCode!=200) return 'error';
    return response.body;
  }

  Future<String> putData(String baseUrl, String endPoint, String data) async {
    final url = Uri.parse(
      baseUrl + endPoint,
    );
    final response = await http.put(url,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    log(response.body);
    if(response.statusCode!=200) return 'error';
    return response.body;
  }
  Future<String> deleteData(String baseUrl, String endPoint) async{
    final url = Uri.parse(
      baseUrl + endPoint
    );
    final response = await http.delete(url);
    log(response.body);
    if(response.statusCode!=200) return 'error';
    return response.body;
  }
}
