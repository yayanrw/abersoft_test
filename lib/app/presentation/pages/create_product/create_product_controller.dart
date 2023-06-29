import 'package:abersoft_test/app/domain/repositories/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CreateProductController extends GetxController {
  final ProductRepository _productRepository = Get.find<ProductRepository>();

  final productNameController = TextEditingController();
  final productDescriptionController = TextEditingController();

  final ImagePicker _imagePicker = ImagePicker();

  XFile? pickedImage;

  bool isLoading = false;
  bool _isPermissionGranted = false;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _getStoragePermission();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> _getStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      _isPermissionGranted = true;
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      _isPermissionGranted = false;
    }
    update();
  }

  Future<void> pickImage() async {
    if (!_isPermissionGranted) {
      return _getStoragePermission();
    }

    pickedImage = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (pickedImage == null) return;
    update();
  }

  Future<void> handleUpload() async {
    pickedImage;
  }
}
