import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../index.dart';

@immutable
class ProductsResponse {

  const ProductsResponse({
    this.bestProduct,
    this.allProduct,
  });

  final List<ProductDto>? bestProduct;
  final List<ProductDto>? allProduct;

  factory ProductsResponse.fromJson(Map<String,dynamic> json) => ProductsResponse(
    bestProduct: json['bestProduct'] != null ? (json['bestProduct'] as List? ?? []).map((e) => ProductDto.fromJson(e as Map<String, dynamic>)).toList() : null,
    allProduct: json['allProduct'] != null ? (json['allProduct'] as List? ?? []).map((e) => ProductDto.fromJson(e as Map<String, dynamic>)).toList() : null
  );
  
  Map<String, dynamic> toJson() => {
    'bestProduct': bestProduct?.map((e) => e.toJson()).toList(),
    'allProduct': allProduct?.map((e) => e.toJson()).toList()
  };

  ProductsResponse clone() => ProductsResponse(
    bestProduct: bestProduct?.map((e) => e.clone()).toList(),
    allProduct: allProduct?.map((e) => e.clone()).toList()
  );


  ProductsResponse copyWith({
    Optional<List<ProductDto>?>? bestProduct,
    Optional<List<ProductDto>?>? allProduct
  }) => ProductsResponse(
    bestProduct: checkOptional(bestProduct, () => this.bestProduct),
    allProduct: checkOptional(allProduct, () => this.allProduct),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ProductsResponse && bestProduct == other.bestProduct && allProduct == other.allProduct;

  @override
  int get hashCode => bestProduct.hashCode ^ allProduct.hashCode;
}
