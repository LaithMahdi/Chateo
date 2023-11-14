import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../core/constant/app_color.dart';

class AuthTextLink extends StatelessWidget {
  final String text;
  final String subText;
  final VoidCallback onTap;
  const AuthTextLink(this.text, this.subText, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(TextSpan(
          text: text,
          style: const TextStyle(fontSize: 13, color: AppColor.neutralWeak),
          children: [
            TextSpan(
                text: subText,
                style: const TextStyle(
                    fontSize: 14,
                    color: AppColor.primary,
                    fontWeight: FontWeight.w900),
                recognizer: TapGestureRecognizer()..onTap = onTap),
          ])),
    );
  }
}
