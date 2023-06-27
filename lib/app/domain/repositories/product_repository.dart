import 'package:abersoft_test/app/core/utils/failure.dart';
import 'package:abersoft_test/app/domain/entities/product.dart';
import 'package:abersoft_test/app/domain/entities/products.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<Failure, Products>> getProducts();

  Future<Either<Failure, Product>> addProduct({
    required String productName,
    required List<String> productImagePaths,
    required String productDescription,
  });
}
