import 'package:abersoft_test/app/data/datasources/remote/dtos/product_dto.dart';
import 'package:abersoft_test/app/data/datasources/remote/responses/products_response.dart';

abstract class ProductDataSource {
  Future<ProductsResponse> fetchProducts();

  Future<ProductDto> fetchAddProduct({
    required String productName,
    required List<String> productImagePaths,
    required String productDescription,
  });
}

class ProductDataSourceImpl implements ProductDataSource {
  @override
  Future<ProductDto> fetchAddProduct({
    required String productName,
    required List<String> productImagePaths,
    required String productDescription,
  }) {
    // TODO: implement fetchAddProduct
    throw UnimplementedError();
  }

  @override
  Future<ProductsResponse> fetchProducts() {
    // TODO: implement fetchProducts
    throw UnimplementedError();
  }
}
