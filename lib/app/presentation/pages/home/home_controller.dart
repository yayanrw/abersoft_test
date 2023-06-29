import 'package:abersoft_test/app/core/utils/network_helper.dart';
import 'package:abersoft_test/app/domain/entities/product.dart';
import 'package:abersoft_test/app/domain/entities/products.dart';
import 'package:abersoft_test/app/domain/repositories/product_repository.dart';
import 'package:abersoft_test/app/domain/repositories/user_credentials_repository.dart';
import 'package:abersoft_test/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ProductRepository _productRepository = Get.find<ProductRepository>();
  final UserCredentialsRepository _userCredentialsRepository =
      Get.find<UserCredentialsRepository>();

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
      onDone: () async {
        //show shimmer effect
        await Future.delayed(1.seconds);
        isLoading = false;
        update();
      },
    );
  }

  Future<void> logOut() async {
    await _userCredentialsRepository.unSetUserCredentials();
    Get.offAllNamed(Routes.LOG_IN);
  }
}
