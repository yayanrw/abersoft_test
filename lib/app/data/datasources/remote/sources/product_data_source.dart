import 'dart:convert';

import 'package:abersoft_test/app/core/networking/api_client.dart';
import 'package:abersoft_test/app/core/utils/network_helper.dart';
import 'package:abersoft_test/app/data/datasources/remote/dtos/product_dto.dart';
import 'package:abersoft_test/app/data/datasources/remote/models/end_points.dart';
import 'package:abersoft_test/app/data/datasources/remote/responses/products_response.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

abstract class ProductDataSource {
  Future<ProductsResponse> fetchProducts();

  Future<ProductDto> fetchAddProduct({
    required String productName,
    required XFile productImage,
    required String productDescription,
  });
}

class ProductDataSourceImpl implements ProductDataSource {
  final ApiClient _apiClient = Get.find<ApiClient>();
  final EndPoints _endPoints = Get.find<EndPoints>();

  @override
  Future<ProductDto> fetchAddProduct({
    required String productName,
    required XFile productImage,
    required String productDescription,
  }) async {
    var request = http.MultipartRequest(
      'POST',
      NetworkHelper.genUri(_endPoints.productEndPoints.resource),
    );

    // Create a multipart file from the XFile
    var multipartFile = await http.MultipartFile.fromPath(
      'productImage',
      productImage.path,
    );

    // Add the multipart file to the request
    request.files.add(multipartFile);

    // Add other fields to the request
    request.fields['productName'] = productName;
    request.fields['productDescription'] = productDescription;

    // Send the request
    var response = await _apiClient.send(request);

    final res = await NetworkHelper.throwExceptionIfClientErrorStreamed(response);
    var responseBody = await res.stream.bytesToString();
    var jsonData = await jsonDecode(responseBody);

    return ProductDto.fromJson(jsonData);
  }


  @override
  Future<ProductsResponse> fetchProducts() async {
    final response = await _apiClient.get(
      NetworkHelper.genUri(_endPoints.productEndPoints.resource),
    );

    final res = NetworkHelper.throwExceptionIfClientError(response);
    return ProductsResponse.fromJson(jsonDecode(res.body));
  }
}
