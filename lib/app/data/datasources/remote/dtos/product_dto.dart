import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../index.dart';

@immutable
class ProductDto {

  const ProductDto({
    this.id,
    this.name,
    this.imageUrl,
    this.productDescription,
  });

  final int? id;
  final String? name;
  final String? imageUrl;
  final String? productDescription;

  factory ProductDto.fromJson(Map<String,dynamic> json) => ProductDto(
    id: json['id'] != null ? json['id'] as int : null,
    name: json['name']?.toString(),
    imageUrl: json['imageUrl']?.toString(),
    productDescription: json['productDescription']?.toString()
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'imageUrl': imageUrl,
    'productDescription': productDescription
  };

  ProductDto clone() => ProductDto(
    id: id,
    name: name,
    imageUrl: imageUrl,
    productDescription: productDescription
  );


  ProductDto copyWith({
    Optional<int?>? id,
    Optional<String?>? name,
    Optional<String?>? imageUrl,
    Optional<String?>? productDescription
  }) => ProductDto(
    id: checkOptional(id, () => this.id),
    name: checkOptional(name, () => this.name),
    imageUrl: checkOptional(imageUrl, () => this.imageUrl),
    productDescription: checkOptional(productDescription, () => this.productDescription),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ProductDto && id == other.id && name == other.name && imageUrl == other.imageUrl && productDescription == other.productDescription;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ imageUrl.hashCode ^ productDescription.hashCode;
}
