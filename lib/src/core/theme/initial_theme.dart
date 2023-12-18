import 'package:flutter/material.dart';
import '../constant/app_color.dart';

ThemeData initialTheme = ThemeData(
  fontFamily: "Mulish",
  //scaffoldBackgroundColor: AppColor.neutralLine,
  appBarTheme: const AppBarTheme(
      color: AppColor.white, titleTextStyle: TextStyle(color: AppColor.black)),
  useMaterial3: true,
);

ThemeData darkTheme = ThemeData(
  fontFamily: "Mulish",
  scaffoldBackgroundColor: AppColor.neutralWeak,
  appBarTheme: const AppBarTheme(
      color: AppColor.black, titleTextStyle: TextStyle(color: AppColor.white)),
  useMaterial3: true,
);
