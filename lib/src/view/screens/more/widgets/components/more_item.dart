import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constant/app_color.dart';

class MoreItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const MoreItem(
      {super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      leading: Icon(icon, color: AppColor.blackNeutral, size: 25),
      title: Text(
        text,
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColor.blackNeutral),
      ),
      trailing: const Icon(EvaIcons.arrowIosForwardOutline),
      onTap: onTap,
    );
  }
}
