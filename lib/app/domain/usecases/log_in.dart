import 'package:abersoft_test/app/core/utils/failure.dart';
import 'package:abersoft_test/app/data/datasources/index.dart';
import 'package:abersoft_test/app/domain/entities/user_credentials.dart';
import 'package:abersoft_test/app/domain/repositories/auth_repository.dart';
import 'package:abersoft_test/app/domain/repositories/user_credentials_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class LogIn {
  final AuthRepository _authRepository = Get.find<AuthRepository>();
  final UserCredentialsRepository _userCredentialsRepository =
      Get.find<UserCredentialsRepository>();

  Future<Either<Failure, String>> exec(LoginRequest loginRequest) async {
    final response = await _authRepository.logIn(loginRequest);

    final token = response.fold((failure) => null, (data) => data);

    if (token != null) {
      await _userCredentialsRepository
          .setUserCredentials(UserCredentials(isLoggedIn: true, token: token));
    }

    return response;
  }
}
