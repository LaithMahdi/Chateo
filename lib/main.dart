import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/binding/initial_binding.dart';
import 'src/core/constant/app_size.dart';
import 'src/core/constant/app_string.dart';
import 'src/core/service/cache_service.dart';
import 'src/core/theme/initial_theme.dart';
import 'src/router/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return GetMaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      theme: initialTheme,
      getPages: pages,
      initialBinding: InitialBindings(),
    );
  }
}
