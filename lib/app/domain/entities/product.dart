import 'package:abersoft_test/app/data/datasources/remote/dtos/product_dto.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final String productDescription;

  const Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.productDescription,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        productDescription,
      ];
}

extension ProductDtoExt on ProductDto {
  Product toEntity() {
    return Product(
      id: id ?? 0,
      name: name ?? "N/A",
      imageUrl: imageUrl ?? "N/A",
      productDescription: productDescription ?? "N/A",
    );
  }
}
