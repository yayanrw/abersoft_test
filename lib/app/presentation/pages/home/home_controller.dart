import 'package:abersoft_test/app/core/utils/network_helper.dart';
import 'package:abersoft_test/app/domain/entities/product.dart';
import 'package:abersoft_test/app/domain/entities/products.dart';
import 'package:abersoft_test/app/domain/repositories/product_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ProductRepository _productRepository = Get.find<ProductRepository>();

  List<Product> bestProducts = [];
  List<Product> allProducts = [];
  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  @override
  void dispose() {
    super.dispose();
    bestProducts = [];
    allProducts = [];
    isLoading = true;
  }

  Future<void> getProducts() async {
    isLoading = true;
    update();
    await NetworkHelper.callDataService<Products>(
      () => _productRepository.getProducts(),
      onSuccess: ((response) async {
        bestProducts.assignAll(response.bestProduct);
        allProducts.assignAll(response.allProduct);
      }),
      onError: ((response) async {
        isLoading = false;
        update();
      }),
      onDone: () {
        isLoading = false;
        update();
      },
    );
  }
}
