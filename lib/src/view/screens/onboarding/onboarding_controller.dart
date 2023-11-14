import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/app_route.dart';
import '../../../core/service/cache_service.dart';
import '../../../data/datasource/onboarding_data.dart';

class OnboardingController extends GetxController {
  int _initialPage = 0;
  late PageController _pageController;
  final CacheService _cacheService = Get.find();
  //Getter
  int get initialPage => _initialPage;
  PageController get pageController => _pageController;
  @override
  void onInit() {
    _pageController = PageController(initialPage: initialPage);
    super.onInit();
  }

  updatePage(int value) {
    _initialPage = value;
    update();
  }

  bool isLastPage() => _initialPage == onboardingData.length - 1 ? true : false;

  handleMoveToOtherPage() {
    if (isLastPage()) {
      _cacheService.sharedPreferences.setInt("onboard", 1);
      Get.offAllNamed(AppRoute.login);
    } else {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 600),
          curve: Curves.fastLinearToSlowEaseIn);
    }
  }
}
