import 'package:abersoft_test/app/core/utils/network_helper.dart';
import 'package:abersoft_test/app/core/utils/snackbar_helper.dart';
import 'package:abersoft_test/app/data/datasources/index.dart';
import 'package:abersoft_test/app/domain/repositories/user_credentials_repository.dart';
import 'package:abersoft_test/app/domain/usecases/log_in.dart';
import 'package:abersoft_test/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  final LogIn _logIn = Get.find<LogIn>();
  final UserCredentialsRepository _userCredentialsRepository =
      Get.find<UserCredentialsRepository>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>(debugLabel: 'Login Form');

  RxBool isLoading = false.obs;

  @override
  void dispose() {
    formKey.currentState?.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void onInit() async {
    super.onInit();
    final userCredentials =
        await _userCredentialsRepository.getUserCredentials();
    if (userCredentials.isLoggedIn) {
      Get.offAllNamed(Routes.HOME);
    }
  }

  void handleLogin() async {
    isLoading.value = true;
    await NetworkHelper.callDataService<String>(
      () => _logIn.exec(
        LoginRequest(
          username: usernameController.text.trim(),
          password: passwordController.text.trim(),
        ),
      ),
      onSuccess: ((response) async {
        SnackBarHelper.success(
            message: "Login successfully, redirecting to home page.");
        await Future.delayed(1.seconds);
        Get.offAllNamed(Routes.HOME);
      }),
      onDone: () async {
        isLoading.value = false;
      },
    );
  }
}
