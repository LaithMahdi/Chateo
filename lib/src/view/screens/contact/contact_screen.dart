import 'package:chateo/src/core/constant/app_image.dart';
import 'package:chateo/src/core/enum/statusRequest.dart';
import 'package:chateo/src/shared/spacer/vertical_spacer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'contact_controller.dart';
import 'widgets/components/contact_item.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ContactControllerImpl());
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
                itemBuilder: (context, index) => ContactItem(
                  user: controller.users[index],
                  onTap: () => controller.goToPersonalChat(
                      controller.users[index].id!,
                      controller.users[index].username!),
                ),
                separatorBuilder: (context, index) => const VerticalSpacer(1.5),
              ),
      ),
    );
  }
}
