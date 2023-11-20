import 'package:flutter/material.dart';
import '../../../../../core/constant/app_color.dart';
import '../../../../../data/model/user_model.dart';
import '../../../../../shared/spacer/vertical_spacer.dart';

class ContactItem extends StatelessWidget {
  final UserModel user;
  final VoidCallback onTap;
  const ContactItem({super.key, required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                    color: AppColor.neutralLine.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  "${user.username}".substring(0, 2).toUpperCase(),
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColor.blackNeutral),
                ),
              ),
              const Positioned(
                  right: 0,
                  top: 0,
                  child: CircleAvatar(
                    maxRadius: 10,
                    backgroundColor: AppColor.white,
                    child: CircleAvatar(
                      maxRadius: 6,
                      backgroundColor: AppColor.green,
                    ),
                  ))
            ],
          ),
          const HorizintalSpacer(1.5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${user.username}",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColor.blackNeutral),
              ),
              const VerticalSpacer(0.5),
              const Text(
                "Online",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.neutralDisabled),
              )
            ],
          ),
        ],
      ),
    );
  }
}
