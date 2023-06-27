import 'package:abersoft_test/app/data/datasources/remote/index.dart';

abstract class AuthDataSource {
  Future<LoginResponse> fetchLogIn(LoginRequest loginRequest);
}

class AuthDataSourceImpl implements AuthDataSource {
  @override
  Future<LoginResponse> fetchLogIn(LoginRequest loginRequest) {
    // TODO: implement fetchLogIn
    throw UnimplementedError();
  }
}
