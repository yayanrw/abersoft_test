import 'dart:convert';

import 'package:abersoft_test/app/core/networking/api_client.dart';
import 'package:abersoft_test/app/core/utils/exceptions.dart';
import 'package:abersoft_test/app/core/utils/network_helper.dart';
import 'package:abersoft_test/app/data/datasources/remote/dtos/product_dto.dart';
import 'package:abersoft_test/app/data/datasources/remote/models/end_points.dart';
import 'package:abersoft_test/app/data/datasources/remote/responses/products_response.dart';
import 'package:get/get.dart';

abstract class ProductDataSource {
  Future<ProductsResponse> fetchProducts();

  Future<ProductDto> fetchAddProduct({
    required String productName,
    required List<String> productImagePaths,
    required String productDescription,
  });
}

class ProductDataSourceImpl implements ProductDataSource {
  final ApiClient _apiClient = Get.find<ApiClient>();
  final EndPoints _endPoints = Get.find<EndPoints>();

  @override
  Future<ProductDto> fetchAddProduct({
    required String productName,
    required List<String> productImagePaths,
    required String productDescription,
  }) async {
    final response = await _apiClient.post(
        NetworkHelper.genUri(_endPoints.productEndPoints.resource),
        headers: NetworkHelper.headerWithToken("token"),
        body: jsonEncode({
          'productName': productName,
          'productImage': productImagePaths,
          'productDescription': productDescription,
        }));

    if (response.statusCode == 200) {
      return ProductDto.fromJson(jsonDecode(response.body));
    } else {
      NetworkHelper.throwExceptionIfClientError(response);
      throw ServerException();
    }
  }

  @override
  Future<ProductsResponse> fetchProducts() async {
    final response = await _apiClient.get(
      NetworkHelper.genUri(_endPoints.productEndPoints.resource),
      headers: NetworkHelper.headerWithToken("token"),
    );

    if (response.statusCode == 200) {
      return ProductsResponse.fromJson(jsonDecode(response.body));
    } else {
      NetworkHelper.throwExceptionIfClientError(response);
      throw ServerException();
    }
  }
}
