import 'dart:convert';
import 'dart:io';

import 'package:abersoft_test/app/core/config/constants.dart';
import 'package:abersoft_test/app/core/utils/exceptions.dart';
import 'package:abersoft_test/app/core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  static Map<String, String> defaultHeader = {
    'Accept': 'application/json',
    'Content-Type': 'application/x-www-form-urlencoded',
  };

  static Map<String, String> headerWithToken(String? token) {
    return {...defaultHeader, 'Authorization': 'Bearer $token'};
  }

  static void throwExceptionIfClientError(http.Response response) {
    if (response.statusCode >= 400 && response.statusCode <= 499) {
      final errorResponse = jsonDecode(response.body);
      final message = errorResponse['message'];
      throw ApplicationException(message);
    }
  }

  static Future<Either<Failure, T>> executeSafely<T>(
      Future<T> Function() action) async {
    try {
      final result = await action();
      return Right(result);
    } on ApplicationException catch (e) {
      return Left(ApplicationFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    } on SocketException {
      return const Left(ConnectionFailure("Connection failed"));
    }
  }

  static Uri genUri(String endPoint) {
    return Uri.parse('$baseUrl$endPoint');
  }
}
