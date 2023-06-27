import 'package:abersoft_test/app/configs/utils/failure.dart';
import 'package:abersoft_test/app/domain/entities/product.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();

  Future<Either<Failure, Product>> addProduct({
    required String productName,
    required List<String> productImagePaths,
    required String productDescription,
  });
}
