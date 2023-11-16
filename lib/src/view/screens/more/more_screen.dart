import 'package:chateo/src/core/constant/app_color.dart';
import 'package:chateo/src/shared/spacer/vertical_spacer.dart';
import 'package:chateo/src/view/screens/more/more_controller.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MoreControllerImpl controller = Get.put(MoreControllerImpl());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "More",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        body: Column(
          children: [
            MoreProfil(
              username: "${controller.initial.username}",
              email: "${controller.initial.username}",
              onPressed: () => controller.viewProfil(),
            ),
            const VerticalSpacer(2),
            MoreItem(icon: EvaIcons.person, text: "Account", onTap: () {}),
            MoreItem(icon: EvaIcons.person, text: "Account", onTap: () {}),
            MoreItem(icon: EvaIcons.person, text: "Account", onTap: () {}),
            MoreItem(icon: EvaIcons.person, text: "Account", onTap: () {}),
          ],
        ));
  }
}

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

class MoreProfil extends StatelessWidget {
  final String username;
  final String email;
  final VoidCallback onPressed;
  const MoreProfil(
      {super.key,
      required this.username,
      required this.email,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: AppColor.neutralLine,
            maxRadius: 30,
            child: Icon(EvaIcons.personOutline,
                size: 30, color: AppColor.blackNeutral),
          ),
          const HorizintalSpacer(1.5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username.toUpperCase(),
                style: const TextStyle(
                    fontSize: 14,
                    color: AppColor.black,
                    fontWeight: FontWeight.w600),
              ),
              const VerticalSpacer(0.5),
              Text(
                email,
                style: const TextStyle(
                    fontSize: 12,
                    color: AppColor.neutralDisabled,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: onPressed,
            child: const Icon(EvaIcons.arrowIosForwardOutline),
          ),
        ],
      ),
    );
  }
}
