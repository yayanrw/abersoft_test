import 'package:abersoft_test/app/data/datasources/local/sources/user_credentials_data_source.dart';
import 'package:abersoft_test/app/domain/entities/user_credentials.dart';
import 'package:abersoft_test/app/domain/repositories/user_credentials_repository.dart';
import 'package:get/get.dart';

class UserCredentialsRepositoryImpl implements UserCredentialsRepository {
  final UserCredentialsDataSource _userCredentialsDataSource =
      Get.find<UserCredentialsDataSource>();

  @override
  Future<UserCredentials> getUserCredentials() async {
    final response = await _userCredentialsDataSource.getUserCredentials();
    return response.toEntity();
  }

  @override
  Future<bool> setUserCredentials(UserCredentials userCredentials) async {
    return await _userCredentialsDataSource.setUserCredentials(
      userCredentials.toPreference(),
    );
  }

  @override
  Future<bool> unSetUserCredentials() async {
    return await _userCredentialsDataSource.unSetUserCredentials();
  }
}
