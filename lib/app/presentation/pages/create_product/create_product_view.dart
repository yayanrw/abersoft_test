import 'package:abersoft_test/app/presentation/widgets/buttons/button_widget.dart';
import 'package:abersoft_test/app/presentation/widgets/images/product_image_picker_widget.dart';
import 'package:abersoft_test/app/presentation/widgets/text_form_fields/input_text_widget.dart';
import 'package:abersoft_test/app/presentation/widgets/texts/TitleWidget.dart';
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 26,
              ),
              const TitleWidget(text: "Create Product"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 63),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 46),
                    ProductImagePickerWidget(
                      onTap: () {
                        controller.pickImage();
                      },
                      image: controller.pickedImage,
                    ),
                    const SizedBox(height: 35),
                    InputTextWidget(
                      controller: controller.productNameController,
                      hintText: "Product Name",
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 9),
                    InputTextWidget(
                      minLines: 6,
                      controller: controller.productDescriptionController,
                      hintText: "Product Description",
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 28),
                    ButtonWidget(
                      text: "Upload",
                      isLoading: controller.isLoading,
                      onPressed: () {
                        controller.handleUpload();
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
