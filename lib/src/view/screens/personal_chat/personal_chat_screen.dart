import 'package:chateo/src/data/model/message_model.dart';
import 'package:chateo/src/shared/spacer/vertical_spacer.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

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
        body: Column(
          children: [
            Expanded(
                child: GetBuilder<PersonalChatControllerImpl>(
              builder: (controller) =>
                  /* ListView(
                    children: [
                      ChatMessage(
                        msg: MessageModel(
                            senderId: controller.id,
                            receiverId: "",
                            createdAt: DateTime.now(),
                            content: "heloo bro"),
                        senderID: controller.id,
                      ),
                      ChatMessage(
                        msg: MessageModel(
                            senderId: "555454454",
                            receiverId: "554",
                            createdAt: DateTime.now(),
                            content: "i'ma very happy to know you"),
                        senderID: controller.id,
                      ),
                      ChatMessage(
                        msg: MessageModel(
                            senderId: controller.id,
                            receiverId: "",
                            createdAt: DateTime.now(),
                            content:
                                "thanksssssssssssssssssssssssssssssssssssssssssssssssssssssss"),
                        senderID: controller.id,
                      ),
                    ],
                  ),*/

                  ListView.builder(
                controller: controller.scrollController,
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  if (index == controller.messages.length) {
                    return const VerticalSpacer(7);
                  }
                  return MessageChat(
                    isSender: controller.messages[index].type == "sender"
                        ? true
                        : false,
                    message: controller.messages[index].message,
                    date: controller.messages[index].date,
                  );
                },
              ),
            )),
            Align(
              alignment: Alignment.bottomCenter,
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
                        onPressed: () => controller.sendMessge(),
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
/*
class ChatMessage extends StatelessWidget {
  final MessageModel msg;

  const ChatMessage({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          msg.type != "destination" ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        constraints: BoxConstraints(maxWidth: AppSize.screenWidth! - 60),
        decoration: BoxDecoration(
            color: msg.type = "source" ? AppColor.primary : AppColor.white,
            borderRadius: BorderRadius.only(
              bottomRight: msg.type != "source"
                  ? const Radius.circular(0)
                  : const Radius.circular(16),
              topRight: const Radius.circular(16),
              topLeft: const Radius.circular(16),
              bottomLeft: msg.type != "source"
                  ? const Radius.circular(16)
                  : const Radius.circular(0),
            )),
        child: Column(
          crossAxisAlignment: msg.type != "source"
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Text(msg.message,
                style: TextStyle(
                    fontSize: 14,
                    color: msg.type != "source"
                        ? AppColor.white
                        : AppColor.blackNeutral)),
            const VerticalSpacer(0.5),
            Text(Jiffy.parse(msg.date.toString()).Hm,
                style: TextStyle(
                    fontSize: 10,
                    color: msg.type != "source"
                        ? AppColor.white
                        : AppColor.neutralDisabled))
          ],
        ),
      ),
    );
  }
}
*/

class MessageChat extends StatelessWidget {
  final String message;
  final DateTime date;
  final bool isSender;
  const MessageChat(
      {super.key,
      required this.isSender,
      required this.message,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        constraints: BoxConstraints(maxWidth: AppSize.screenWidth! - 60),
        decoration: BoxDecoration(
            color: isSender ? AppColor.primary : AppColor.white,
            borderRadius: BorderRadius.only(
              bottomRight: isSender
                  ? const Radius.circular(0)
                  : const Radius.circular(16),
              topRight: const Radius.circular(16),
              topLeft: const Radius.circular(16),
              bottomLeft: isSender
                  ? const Radius.circular(16)
                  : const Radius.circular(0),
            )),
        child: Column(
          crossAxisAlignment:
              isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(message,
                style: TextStyle(
                    fontSize: 14,
                    color: isSender ? AppColor.white : AppColor.blackNeutral)),
            const VerticalSpacer(0.5),
            Text(Jiffy.parse(date.toString()).Hm,
                style: TextStyle(
                    fontSize: 10,
                    color:
                        isSender ? AppColor.white : AppColor.neutralDisabled))
          ],
        ),
      ),
    );
  }
}
