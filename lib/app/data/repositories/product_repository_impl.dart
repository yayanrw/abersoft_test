import 'package:abersoft_test/app/core/utils/failure.dart';
import 'package:abersoft_test/app/core/utils/network_helper.dart';
import 'package:abersoft_test/app/data/datasources/remote/sources/product_data_source.dart';
import 'package:abersoft_test/app/domain/entities/product.dart';
import 'package:abersoft_test/app/domain/entities/products.dart';
import 'package:abersoft_test/app/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource _productDataSource = Get.find<ProductDataSource>();

  @override
  Future<Either<Failure, Product>> addProduct({
    required String productName,
    required List<String> productImagePaths,
    required String productDescription,
  }) {
    return NetworkHelper.executeSafely(() async {
      final response = await _productDataSource.fetchAddProduct(
        productName: productName,
        productImagePaths: productImagePaths,
        productDescription: productDescription,
      );

      return response.toEntity();
    });
  }

  @override
  Future<Either<Failure, Products>> getProducts() async {
    return NetworkHelper.executeSafely<Products>(() async {
      final response = await _productDataSource.fetchProducts();
      return response.toEntity();
    });
  }
}
