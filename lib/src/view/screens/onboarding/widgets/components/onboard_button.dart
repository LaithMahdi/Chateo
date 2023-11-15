import 'package:flutter/material.dart';

import '../../../../../core/constant/app_color.dart';

class OnboardButton extends StatelessWidget {
  const OnboardButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColor.orange,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.chevron_right_rounded,
          size: 35,
          color: AppColor.white,
        ),
      ),
    );
  }
}
