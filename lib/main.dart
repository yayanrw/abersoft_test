import 'package:abersoft_test/app/core/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';

import 'app/routes/app_pages.dart';

void main() async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) {
    debugPrint(event.message);
  });

  WidgetsFlutterBinding.ensureInitialized();

  await Injection.init();

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
