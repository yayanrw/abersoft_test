
import 'package:abersoft_test/app/data/datasources/remote/requests/login_request.dart';
import 'package:abersoft_test/app/data/datasources/remote/responses/login_response.dart';

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
