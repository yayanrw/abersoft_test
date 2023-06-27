import 'package:get/get.dart';

import '../presentation/pages/create_product/bindings/create_product_binding.dart';
import '../presentation/pages/create_product/views/create_product_view.dart';
import '../presentation/pages/home/bindings/home_binding.dart';
import '../presentation/pages/home/views/home_view.dart';
import '../presentation/pages/log_in/bindings/log_in_binding.dart';
import '../presentation/pages/log_in/views/log_in_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOG_IN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOG_IN,
      page: () => const LogInView(),
      binding: LogInBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_PRODUCT,
      page: () => const CreateProductView(),
      binding: CreateProductBinding(),
    ),
  ];
}
