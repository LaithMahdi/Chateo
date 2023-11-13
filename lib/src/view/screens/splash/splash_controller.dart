import 'package:get/get.dart';
import '../../../core/constant/app_route.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.offAllNamed(AppRoute.onboarding),
    );
    super.onInit();
  }
}
