import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constant/app_color.dart';
import '../../../../../data/datasource/onboarding_data.dart';
import '../../onboarding_controller.dart';

class OnboardProgress extends StatelessWidget {
  const OnboardProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          onboardingData.length,
          (index) => GetBuilder<OnboardingController>(
            builder: (controller) => AnimatedContainer(
              duration: const Duration(milliseconds: 700),
              curve: Curves.ease,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: controller.initialPage == index ? 40 : 15,
              height: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  controller.initialPage == index ? 15 : 50,
                ),
                color: controller.initialPage == index
                    ? AppColor.primary
                    : AppColor.primary.withOpacity(0.3),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
