import 'dart:convert';
import 'dart:io';

import 'package:abersoft_test/app/core/config/constants.dart';
import 'package:abersoft_test/app/core/utils/exceptions.dart';
import 'package:abersoft_test/app/core/utils/failure.dart';
import 'package:abersoft_test/app/core/utils/snackbar_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  static Map<String, String> defaultHeader = {
    'Accept': 'application/json',
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

  static Future<T?> callDataService<T>(
    Future<Either<Failure, T>> Function() future, {
    bool isLoading = true,
    Function(T response)? onSuccess,
    Function(dynamic e)? onError,
    Function()? onDone,
  }) async {
    try {
      final Either<Failure, T> response = await future();

      response.fold((failure) {
        if (onError != null) {
          if (failure is ServerFailure) {
            throw ServerException();
          }
          if (failure is ApplicationFailure) {
            throw ApplicationException(failure.message);
          }
          if (failure is ConnectionFailure) {
            throw SocketException(failure.message);
          }
          onError(failure);
        } else {
          SnackBarHelper.error(title: "Error", message: failure.message);
        }
        return failure;
      }, (success) {
        if (onSuccess != null) onSuccess(success);
        return success;
      });
    } on ServerException {
      SnackBarHelper.error(
        title: "Server Error",
        message:
            "An error occured when connecting to the server, please try again.",
      );
    } on ApplicationException catch (e) {
      SnackBarHelper.error(title: "Error", message: e.message);
    } on SocketException catch (e) {
      SnackBarHelper.error(title: "Error Connection", message: e.message);
    } finally {
      if (isLoading) false;
      if (onDone != null) onDone();
    }
    return null;
  }

  static Uri genUri(String endPoint) {
    return Uri.parse('$baseUrl$endPoint');
  }
}
