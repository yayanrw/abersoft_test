import 'package:abersoft_test/app/core/utils/network_helper.dart';
import 'package:abersoft_test/app/core/utils/snackbar_helper.dart';
import 'package:abersoft_test/app/data/datasources/index.dart';
import 'package:abersoft_test/app/domain/usecases/log_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  final LogIn _logIn = Get.find<LogIn>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool isLoading = false.obs;

  @override
  void onDispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
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
      }),
      onDone: () async {
        isLoading.value = false;
      },
    );
  }
}
