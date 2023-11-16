import 'package:chateo/src/core/constant/app_color.dart';
import 'package:chateo/src/core/constant/app_image.dart';
import 'package:chateo/src/core/enum/statusRequest.dart';
import 'package:chateo/src/data/model/user_model.dart';
import 'package:chateo/src/shared/spacer/vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'contact_controller.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ContactControllerImpl controller = Get.put(ContactControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
      ),
      body: GetBuilder<ContactControllerImpl>(
        builder: (controller) => controller.statusRequest ==
                StatusRequest.loading
            ? Center(child: LottieBuilder.asset(AppImage.loading))
            : ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                itemCount: controller.users.length,
                itemBuilder: (context, index) {
                  UserModel user = controller.users[index];
                  return Row(
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
                  );
                },
                separatorBuilder: (context, index) => const VerticalSpacer(1.5),
              ),
      ),
    );
  }
}
