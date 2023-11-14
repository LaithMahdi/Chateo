import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/app_color.dart';
import 'onboarding_controller.dart';
import 'widgets/onboard_view_body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingController());
    return const Scaffold(
      backgroundColor: AppColor.primary,
      body: OnboardViewBody(),
    );
  }
}
