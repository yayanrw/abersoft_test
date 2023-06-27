import 'package:abersoft_test/app/domain/entities/user_credentials.dart';

abstract class UserCredentialsRepository {
  Future<UserCredentials> getUserCredentials();

  Future<bool> setUserCredentials(UserCredentials userCredentials);

  Future<bool> unSetUserCredentials();
}
