import 'package:abersoft_test/app/data/repositories/auth_repository_impl.dart';
import 'package:abersoft_test/app/data/repositories/product_repository_impl.dart';
import 'package:abersoft_test/app/data/repositories/user_credentials_repository_impl.dart';
import 'package:abersoft_test/app/domain/repositories/auth_repository.dart';
import 'package:abersoft_test/app/domain/repositories/product_repository.dart';
import 'package:abersoft_test/app/domain/repositories/user_credentials_repository.dart';
import 'package:get/get.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut<ProductRepository>(
      () => ProductRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut<UserCredentialsRepository>(
      () => UserCredentialsRepositoryImpl(),
      fenix: true,
    );
  }
}
