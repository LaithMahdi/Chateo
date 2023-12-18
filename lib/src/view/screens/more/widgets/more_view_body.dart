import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../api/api.dart';
import '../../../../core/constant/app_image.dart';
import '../../../../core/enum/statusRequest.dart';
import '../../../../shared/spacer/vertical_spacer.dart';
import '../../auth/widgets/auth_button.dart';
import '../more_controller.dart';
import 'components/more_item.dart';
import 'components/more_profil.dart';

class MoreViewBody extends GetView<MoreControllerImpl> {
  const MoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MoreProfil(
          username: "${controller.initial.username}",
          email: "${controller.initial.email}",
          profileImage: "${Api.getImage}/${controller.initial.profilePhoto}",
          onPressed: () => controller.viewProfil(),
        ),
        const VerticalSpacer(1),
        MoreItem(icon: EvaIcons.personOutline, text: "Account", onTap: () {}),
        MoreItem(
            icon: EvaIcons.messageCircleOutline, text: "Chats", onTap: () {}),
        const VerticalSpacer(2),
        MoreItem(
            icon: EvaIcons.sunOutline,
            text: "Appereance",
            onTap: () => controller.changeApperance()),
        MoreItem(
            icon: EvaIcons.bellOutline, text: "Notification", onTap: () {}),
        MoreItem(
            icon: EvaIcons.alertCircleOutline, text: "Privacy", onTap: () {}),
        MoreItem(
            icon: EvaIcons.questionMarkCircleOutline,
            text: "Help",
            onTap: () {}),
        MoreItem(
            icon: EvaIcons.emailOutline,
            text: "Invite Your Friends",
            onTap: () {}),
        const VerticalSpacer(2),
        GetBuilder<MoreControllerImpl>(
          builder: (controller) =>
              StatusRequest.loading == controller.statusRequest
                  ? Center(
                      child: LottieBuilder.asset(AppImage.loading,
                          height: 70, width: 250),
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: AuthButton(
                        text: "Logout",
                        onPressed: () => controller.logout(),
                      ),
                    ),
        )
      ],
    );
  }
}
