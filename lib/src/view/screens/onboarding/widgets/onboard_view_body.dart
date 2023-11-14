import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/app_color.dart';
import '../../../../core/constant/app_size.dart';
import '../../../../data/datasource/onboarding_data.dart';
import '../../../../data/model/onboard_model.dart';
import '../onboarding_controller.dart';
import 'components/onboard_button.dart';
import 'components/onboard_item.dart';
import 'components/onboard_progress.dart';

class OnboardViewBody extends GetView<OnboardingController> {
  const OnboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: AppSize.screenHeight! / 1.7,
            bottom: 0,
            child: Container(
              width: AppSize.screenWidth,
              padding: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
            )),
        PageView.builder(
          controller: controller.pageController,
          itemCount: onboardingData.length,
          onPageChanged: (value) => controller.updatePage(value),
          itemBuilder: (context, index) {
            OnboardModel model = onboardingData[index];
            return OnboardItem(
              title: model.title,
              paragraph: model.paragraph,
              picture: model.picture,
            );
          },
        ),
        Positioned(
          bottom: 15,
          right: 25,
          left: 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const OnboardProgress(),
              OnboardButton(onTap: () => controller.handleMoveToOtherPage())
            ],
          ),
        ),
      ],
    );
  }
}
