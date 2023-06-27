import 'package:abersoft_test/app/data/datasources/remote/dtos/product_dto.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final String productDescription;

  const Product(this.id, this.name, this.imageUrl, this.productDescription);

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
      id ?? 0,
      name ?? "N/A",
      imageUrl ?? "N/A",
      productDescription ?? "N/A",
    );
  }
}
