import 'package:abersoft_test/app/core/di/local_data_source_bindings.dart';
import 'package:abersoft_test/app/core/di/remote_data_source_bindings.dart';
import 'package:abersoft_test/app/core/di/repository_bindings.dart';
import 'package:abersoft_test/app/core/di/storage_service.dart';
import 'package:abersoft_test/app/core/networking/api_client.dart';
import 'package:abersoft_test/app/data/datasources/remote/models/end_points.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Injection {
  static Future<void> init() async {
    await Get.putAsync(() => StorageService().init());
    await GetStorage.init();

    Get.lazyPut<ApiClient>(() => ApiClient(), fenix: true);
    Get.lazyPut<EndPoints>(() => EndPoints(), fenix: true);

    RepositoryBindings().dependencies();
    LocalDataSourceBindings().dependencies();
    RemoteDataSourceBindings().dependencies();
  }
}
