import 'package:abersoft_test/app/domain/entities/user_credentials.dart';
import 'package:abersoft_test/app/domain/repositories/user_credentials_repository.dart';
import 'package:get/get.dart';

class GetToken {
  final UserCredentialsRepository _userCredentialsRepository =
      Get.find<UserCredentialsRepository>();

  Future<String> exec() async {
    final UserCredentials userCredentials =
        await _userCredentialsRepository.getUserCredentials();
    return userCredentials.token;
  }
}
