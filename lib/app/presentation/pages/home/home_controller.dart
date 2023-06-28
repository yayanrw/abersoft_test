import 'package:abersoft_test/app/core/utils/network_helper.dart';
import 'package:abersoft_test/app/domain/entities/product.dart';
import 'package:abersoft_test/app/domain/entities/products.dart';
import 'package:abersoft_test/app/domain/repositories/product_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ProductRepository _productRepository = Get.find<ProductRepository>();

  List<Product> bestProducts = [];
  List<Product> allProducts = [];

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getProducts() async {
    await NetworkHelper.callDataService<Products>(
      () => _productRepository.getProducts(),
      onSuccess: ((response) async {
        bestProducts.assignAll(response.bestProduct);
        allProducts.assignAll(response.allProduct);
      }),
      onError: ((response) async {}),
      onDone: () {
        update();
      },
    );
  }
}
