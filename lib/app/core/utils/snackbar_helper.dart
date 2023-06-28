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
        Icons.error,
        color: Colors.red,
        key: Key("server_error"),
      ),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
