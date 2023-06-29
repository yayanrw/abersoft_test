import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'create_product_controller.dart';

class CreateProductView extends GetView<CreateProductController> {
  const CreateProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateProductController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Create New Product'),
        ),
        body: const Center(
          child: Text(
            'CreateProductView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    });
  }
}
