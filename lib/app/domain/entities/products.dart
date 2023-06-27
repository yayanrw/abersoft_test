import 'package:abersoft_test/app/data/datasources/index.dart';
import 'package:abersoft_test/app/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

class Products extends Equatable {
  final List<Product> bestProduct;
  final List<Product> allProduct;

  const Products({required this.bestProduct, required this.allProduct});

  @override
  List<Object?> get props => [bestProduct, allProduct];
}

extension ProductsResponseExt on ProductsResponse {
  Products toEntity() {
    return Products(
      bestProduct: bestProduct?.map((e) => e.toEntity()).toList() ?? [],
      allProduct: allProduct?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}
