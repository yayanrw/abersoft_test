import 'package:abersoft_test/app/configs/utils/failure.dart';
import 'package:abersoft_test/app/data/datasources/index.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> logIn(LoginRequest loginRequest);
}
