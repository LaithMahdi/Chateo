import 'package:chateo/src/data/model/message_model.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_size.dart';
import 'personal_chat_controller.dart';

class PersonalChatScreen extends StatelessWidget {
  const PersonalChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PersonalChatControllerImpl controller =
        Get.put(PersonalChatControllerImpl());
    return Scaffold(
        backgroundColor: AppColor.whiteNeutral,
        appBar: AppBar(
          title: Text(controller.username,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          actions: [
            IconButton(
                onPressed: () {},
                icon:
                    const Icon(EvaIcons.search, color: AppColor.blackNeutral)),
            IconButton(
                onPressed: () {},
                icon: const Icon(EvaIcons.menu, color: AppColor.blackNeutral)),
          ],
          scrolledUnderElevation: 0,
        ),
        body: Stack(
          children: [
            Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 5,
                child: GetBuilder<PersonalChatControllerImpl>(
                  builder: (controller) => ListView.builder(
                    itemCount: controller.messages.length,
                    itemBuilder: (context, index) {
                      MessageModel msg = controller.messages[index];
                      return Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        constraints:
                            BoxConstraints(maxWidth: AppSize.screenWidth! - 60),
                        decoration: const BoxDecoration(
                          color: AppColor.orange,
                        ),
                        child: Text(msg.content),
                      );
                    },
                  ),
                )),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColor.white,
                ),
                height: AppSize.screenHeight! * .1,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(EvaIcons.plus,
                            size: 25, color: AppColor.neutralDisabled)),
                    Expanded(
                        child: TextField(
                      controller: controller.message,
                      decoration: const InputDecoration(
                          hintText: "Write your message",
                          hintStyle: TextStyle(
                              fontSize: 14, color: AppColor.neutralWeak),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          fillColor: AppColor.whiteNeutral,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          )),
                    )),
                    IconButton(
                        onPressed: () => controller.send(),
                        icon: const Icon(EvaIcons.navigation2,
                            color: AppColor.primary, size: 25))
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
