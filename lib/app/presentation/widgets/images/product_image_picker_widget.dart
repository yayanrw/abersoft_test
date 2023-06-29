import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductImagePickerWidget extends StatelessWidget {
  const ProductImagePickerWidget({super.key, this.image, required this.onTap});

  final VoidCallback onTap;
  final XFile? image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 156,
        decoration: const BoxDecoration(
          color: Color(0xFFD9D9D9),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: image == null
            ? const Center(
                child: Text("Pick image"),
              )
            : ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                child: Image.file(
                  File(image!.path),
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }
}
