import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Constant/String.dart';


class CallApi {


  Future<http.Response> postData(data, apiUrl) async {
    print("URL: $baseUrl$apiUrl");
    return await http.post(
      Uri.parse(baseUrl + apiUrl),
      body: jsonEncode(data),
      headers: await _setHeader(),
    );
  }

  //delete method for deleting data with id
  Future<http.Response> deleteData(apiUrl) async {
    print("URL: $baseUrl$apiUrl");
    return await http.delete(
      Uri.parse(baseUrl + apiUrl),
      headers: await _setHeader(),
    );
  }

  Future<http.Response> getData(String apiUrl) async {

    print("URL: $baseUrl$apiUrl");
    return await http.get(
      Uri.parse(baseUrl + apiUrl),
      headers: await _setHeader(),
    );
  }

  //put method for updating data
  Future<http.Response> putData(data, apiUrl) async {
    return await http.put(
      Uri.parse(baseUrl + apiUrl),
      body: jsonEncode(data),
      headers: await _setHeader(),
    );
  }

  //patch method for updating data
  Future<http.Response> patchData(data, apiUrl) async {
    return await http.patch(
      Uri.parse(baseUrl + apiUrl),
      body: jsonEncode(data),
      headers: await _setHeader(),
    );
  }

  Future<Map<String, String>> _setHeader() async {
    var headers = {
      'Content-type': 'application/vnd.api+json',
      'Accept': 'application/vnd.api+json',
    };

    return headers;
  }
}
