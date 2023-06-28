import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

class ApiClient extends http.BaseClient {
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    Logger.root.info(
        'request => ${request.method} (${request.url}) \n ${request.headers}');
    return request.send().then((value) {
      debugPrint('${value.statusCode} ${value.reasonPhrase}');
      return value;
    }).catchError((err) async {
      Logger.root.warning('error => ${err.toString()}');
      return http.StreamedResponse(
          Stream.fromIterable([err.toString().codeUnits]), 500);
    });
  }

  @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) {
    return super.get(url, headers: headers).then((value) {
      Logger.root.info(
          "============================RESPONSE============================");
      Logger.root.info(value.body);
      Logger.root.info(
          "================================================================");
      return value;
    }).catchError((err) {
      debugPrint(err.toString());
    });
  }

  @override
  Future<http.Response> post(Uri url,
      {Map<String, String>? headers, body, Encoding? encoding}) {
    return super
        .post(url, headers: headers, body: body, encoding: encoding)
        .then((value) {
      Logger.root.info(
          "============================RESPONSE============================");
      Logger.root.info(value.body);
      Logger.root.info(
          "================================================================");
      return value;
    }).catchError((err) {
      debugPrint(err.toString());
    });
  }
}
