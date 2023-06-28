import 'package:abersoft_test/app/presentation/widgets/button_widget.dart';
import 'package:abersoft_test/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'log_in_controller.dart';

class LogInView extends GetView<LogInController> {
  const LogInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 66),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 84),
                  Assets.images.abersoft.image(height: 53),
                  const SizedBox(height: 119),
                  TextFormField(
                    controller: controller.usernameController,
                    decoration: const InputDecoration(
                      hintText: "Username",
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: controller.passwordController,
                    decoration: const InputDecoration(
                      hintText: "Password",
                    ),
                  ),
                  const SizedBox(height: 25),
                  Obx(() {
                    return ButtonWidget(
                      text: "LOGIN",
                      isLoading: controller.isLoading.value,
                      onPressed: () {
                        controller.handleLogin();
                      },
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
