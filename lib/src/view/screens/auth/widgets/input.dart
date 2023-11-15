import 'package:flutter/material.dart';
import '../../../../core/constant/app_color.dart';

class Input extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool? obscure;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String? Function(String? value)? validator;
  const Input(
      {super.key,
      required this.hintText,
      required this.controller,
      this.obscure,
      this.suffixIcon,
      this.keyboardType,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: obscure == null || obscure == false ? false : true,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.whiteNeutral,
        hintText: hintText,
        contentPadding: const EdgeInsets.all(20),
        hintStyle:
            const TextStyle(fontSize: 14, color: AppColor.neutralDisabled),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:
              BorderSide(color: AppColor.neutralDisabled.withOpacity(0.5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:
              BorderSide(color: AppColor.neutralDisabled.withOpacity(0.5)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColor.red, width: 1.5),
        ),
        errorStyle: const TextStyle(
            color: AppColor.red, fontSize: 14, fontWeight: FontWeight.bold),
        suffixIcon: suffixIcon ?? const SizedBox(),
      ),
    );
  }
}
