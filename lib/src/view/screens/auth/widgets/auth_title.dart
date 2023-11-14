import 'package:flutter/material.dart';
import '../../../../core/constant/app_color.dart';

class AuthTitle extends StatelessWidget {
  final String text;
  const AuthTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 14, color: AppColor.neutralWeak, letterSpacing: 0.5),
    );
  }
}
