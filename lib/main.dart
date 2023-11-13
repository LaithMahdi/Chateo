import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/core/constant/app_color.dart';
import 'src/core/constant/app_string.dart';
import 'src/router/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Mulish",
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
        useMaterial3: true,
      ),
      getPages: pages,
    );
  }
}
