import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarHelper {
  static error({
    String title = "Error",
    String message = "An error occured",
  }) {
    Get.snackbar(
      title,
      message,
      margin: const EdgeInsets.all(16),
      icon: const Icon(
        Icons.error_rounded,
        color: Colors.red,
        key: Key("snack_bar_error"),
      ),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static success({
    String title = "Success",
    String message = "Successfully",
  }) {
    Get.snackbar(
      title,
      message,
      margin: const EdgeInsets.all(16),
      icon: const Icon(
        Icons.check_circle,
        color: Colors.green,
        key: Key("snack_bar_success"),
      ),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static warning({
    String title = "Warning",
    String message = "Warning Description",
  }) {
    Get.snackbar(
      title,
      message,
      margin: const EdgeInsets.all(16),
      icon: const Icon(
        Icons.warning_rounded,
        color: Colors.orange,
        key: Key("snack_bar_warning"),
      ),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
