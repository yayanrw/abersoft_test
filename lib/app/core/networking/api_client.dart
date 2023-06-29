import 'dart:convert';

import 'package:abersoft_test/app/core/utils/network_helper.dart';
import 'package:abersoft_test/app/domain/usecases/get_token.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:get/get.dart';

class ApiClient extends http.BaseClient {
  final GetToken _getToken = Get.find<GetToken>();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final token = await _getToken.exec();

    Logger.root.info(
        '============================REQUEST============================');

    if (token != "" && token != "N/A") {
      request.headers.addAll(NetworkHelper.headerWithToken(token));
    } else {
      request.headers.addAll(NetworkHelper.defaultHeader);
    }

    return request.send().then((value) {
      Logger.root.info(
          "============================RESPONSE============================");
      Logger.root.info('${value.statusCode} ${request.method} ${request.url}');
      Logger.root.info('${request.headers}');
      Logger.root.info(value.stream);
      Logger.root.info(
          "================================================================");
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
