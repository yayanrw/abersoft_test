import 'package:abersoft_test/app/data/datasources/index.dart';

abstract class UserCredentialsDataSource {
  Future<UserCredentialsPreference> getUserCredentials();

  Future<bool> setUserCredentials(
      UserCredentialsPreference userCredentialsPreference);

  Future<bool> unSetUserCredentials();
}

class UserCredentialsDataSourceImpl implements UserCredentialsDataSource {
  @override
  Future<UserCredentialsPreference> getUserCredentials() {
    // TODO: implement getUserCredentials
    throw UnimplementedError();
  }

  @override
  Future<bool> setUserCredentials(
      UserCredentialsPreference userCredentialsPreference) {
    // TODO: implement setUserCredentials
    throw UnimplementedError();
  }

  @override
  Future<bool> unSetUserCredentials() {
    // TODO: implement unSetUserCredentials
    throw UnimplementedError();
  }
}
