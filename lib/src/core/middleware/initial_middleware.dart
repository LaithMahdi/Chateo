import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/app_route.dart';
import '../service/cache_service.dart';

class InitialMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  CacheService myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getInt("onboard") == 1) {
      return const RouteSettings(name: AppRoute.login);
    }

    if (myServices.sharedPreferences.getInt("onboard") == 2) {
      return const RouteSettings(name: AppRoute.initial);
    }

    return null;
  }
}
