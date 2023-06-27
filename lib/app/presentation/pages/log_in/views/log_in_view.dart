import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/log_in_controller.dart';

class LogInView extends GetView<LogInController> {
  const LogInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LogInView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LogInView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
