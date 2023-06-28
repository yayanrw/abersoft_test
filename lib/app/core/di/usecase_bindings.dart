import 'package:abersoft_test/app/domain/usecases/log_in.dart';
import 'package:get/get.dart';

class UseCaseBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogIn>(() => LogIn(), fenix: true);
  }

}