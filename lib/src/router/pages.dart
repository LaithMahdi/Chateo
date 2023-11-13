import 'package:get/get.dart';
import '../core/constant/app_route.dart';
import '../view/screens/onboarding/onboarding_screen.dart';
import '../view/screens/splash/splash_screen.dart';

List<GetPage<dynamic>>? pages = [
  GetPage(name: AppRoute.splash, page: () => const SplashScreen()),
  GetPage(name: AppRoute.onboarding, page: () => const OnboardingScreen()),
];
