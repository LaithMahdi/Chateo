import 'package:chateo/src/core/theme/initial_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/binding/initial_binding.dart';
import 'src/core/constant/app_size.dart';
import 'src/core/constant/app_string.dart';
import 'src/core/service/cache_service.dart';
import 'src/router/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);

    return GetMaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      getPages: pages,
      theme: initialTheme,
      initialBinding: InitialBindings(),
    );
  }
}
