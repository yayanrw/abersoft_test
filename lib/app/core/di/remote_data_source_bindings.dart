import 'package:abersoft_test/app/data/datasources/remote/sources/auth_data_source.dart';
import 'package:abersoft_test/app/data/datasources/remote/sources/product_data_source.dart';
import 'package:get/get.dart';

class RemoteDataSourceBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthDataSource>(
      () => AuthDataSourceImpl(),
      fenix: true,
    );
    Get.lazyPut<ProductDataSource>(
      () => ProductDataSourceImpl(),
      fenix: true,
    );
  }
}
