import 'package:abersoft_test/app/data/datasources/local/sources/user_credentials_data_source.dart';
import 'package:get/get.dart';

class LocalDataSourceBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserCredentialsDataSource>(
      () => UserCredentialsDataSourceImpl(),
      fenix: true,
    );
  }
}
