import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constant/app_color.dart';
import '../../../../../shared/spacer/vertical_spacer.dart';

class MoreProfil extends StatelessWidget {
  final String username;
  final String email;
  final String profileImage;
  final VoidCallback onPressed;
  const MoreProfil(
      {super.key,
      required this.username,
      required this.email,
      required this.onPressed,
      required this.profileImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
            // ignore: unnecessary_null_comparison
            backgroundImage: profileImage != null
                ? NetworkImage(profileImage) // Assuming profilePhoto is a URL
                : null,
            // ignore: unnecessary_null_comparison
            child: profileImage == null
                ? const Icon(
                    EvaIcons.personOutline,
                    size: 30,
                    color: Colors.black,
                  )
                : null,
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
