import 'package:abersoft_test/app/core/utils/failure.dart';
import 'package:abersoft_test/app/core/utils/network_helper.dart';
import 'package:abersoft_test/app/data/datasources/remote/requests/login_request.dart';
import 'package:abersoft_test/app/data/datasources/remote/sources/auth_data_source.dart';
import 'package:abersoft_test/app/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class AuthRepositoryImpl implements AuthRepository {
  final _authDataSource = Get.find<AuthDataSource>();

  @override
  Future<Either<Failure, String>> logIn(LoginRequest loginRequest) async {
    return NetworkHelper.executeSafely<String>(() async {
      final response = await _authDataSource.fetchLogIn(loginRequest);
      return response.token ?? "";
    });
  }
}
