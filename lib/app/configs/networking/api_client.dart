import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiClient extends http.BaseClient {
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    debugPrint(
        'request => ${request.method} (${request.url}) \n ${request.headers}');
    return request.send().then((value) {
      debugPrint('${value.statusCode} ${value.reasonPhrase}');
      return value;
    }).catchError((err) async {
      debugPrint('error => ${err.toString()}');
      return http.StreamedResponse(
          Stream.fromIterable([err.toString().codeUnits]), 500);
    });
  }

  @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) {
    return super.get(url, headers: headers).then((value) {
      debugPrint("response => ${value.body}");
      return value;
    }).catchError((err) {
      debugPrint('error => ${err.toString()}');
    });
  }

  @override
  Future<http.Response> post(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return post(url, headers: headers, body: body, encoding: encoding)
        .then((value) {
      debugPrint('response => ${value.body}');
      return value;
    }).catchError((err) {
      debugPrint('error => ${err.toString()}');
    });
  }
}
