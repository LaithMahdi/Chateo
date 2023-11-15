import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../core/constant/app_color.dart';
import '../../../../../core/constant/app_size.dart';
import '../../onboarding_controller.dart';

class OnboardItem extends GetView<OnboardingController> {
  final String title;
  final String paragraph;
  final String picture;
  const OnboardItem({
    super.key,
    required this.title,
    required this.paragraph,
    required this.picture,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.screenWidth,
      height: AppSize.screenHeight,
      child: Stack(children: [
        Container(
          margin: EdgeInsets.only(top: AppSize.screenHeight! * .1),
          alignment: Alignment.topCenter,
          child: SvgPicture.asset(picture,
              width: AppSize.screenWidth! * .4,
              height: AppSize.screenHeight! * .3),
        ),
        Positioned(
          top: MediaQuery.sizeOf(context).height * .62,
          bottom: 0,
          left: 25,
          right: 25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                title,
                style: TextStyle(
                    color: AppColor.orange,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(paragraph,
                    style: const TextStyle(
                        color: AppColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
              ),
              const Spacer(),
            ],
          ),
        ),
      ]),
    );
  }
}
