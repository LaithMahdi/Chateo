import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/constant/app_color.dart';
import '../../../../../core/constant/app_image.dart';
import '../../../../../core/enum/statusRequest.dart';
import '../../../../../core/function/valid_input.dart';
import '../../../../../shared/spacer/vertical_spacer.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/auth_text_link.dart';
import '../../widgets/input.dart';
import '../../widgets/label.dart';
import '../sign_up_controller.dart';

class SignUpViewBody extends GetView<SignUpControllerImpl> {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.form,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          children: [
            const Center(child: UploadImage()),
            const Label("Username :"),
            Input(
              hintText: "Username",
              controller: controller.username,
              validator: (value) => validInput(value!, 3, 75, "username"),
            ),
            const Label("Email :"),
            Input(
              hintText: "Email",
              controller: controller.email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) => validInput(value!, 6, 75, "email"),
            ),
            const Label("Password :"),
            GetBuilder<SignUpControllerImpl>(
              builder: (controller) => Input(
                hintText: "Password",
                controller: controller.password,
                obscure: controller.obscure,
                suffixIcon: GestureDetector(
                  child: Icon(
                    controller.obscure ? EvaIcons.eyeOff : EvaIcons.eye,
                    color: AppColor.neutralWeak,
                  ),
                  onTap: () => controller.updateObscure(),
                ),
                validator: (value) => validInput(value!, 6, 75, "password"),
              ),
            ),
            const Label("Confirm password :"),
            GetBuilder<SignUpControllerImpl>(
              builder: (controller) => Input(
                hintText: "Confirm password",
                controller: controller.confirmPassword,
                obscure: controller.obscureConf,
                suffixIcon: GestureDetector(
                  child: Icon(
                    controller.obscureConf ? EvaIcons.eyeOff : EvaIcons.eye,
                    color: AppColor.neutralWeak,
                  ),
                  onTap: () => controller.updateObscureConf(),
                ),
                validator: (value) => validInput(value!, 6, 75, "password"),
              ),
            ),
            const VerticalSpacer(2),
            GetBuilder<SignUpControllerImpl>(
              builder: (controller) =>
                  controller.statusRequest == StatusRequest.loading
                      ? Center(child: LottieBuilder.asset(AppImage.loading))
                      : AuthButton(
                          text: "Sign up",
                          onPressed: () => controller.signUp()),
            ),
            const VerticalSpacer(9),
            AuthTextLink("You Already have an account ? ", "Sign in",
                () => controller.goToLogin()),
            const VerticalSpacer(1),
          ],
        ));
  }
}

class UploadImage extends GetView<SignUpControllerImpl> {
  const UploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          maxRadius: MediaQuery.sizeOf(context).width * .2,
          backgroundColor: AppColor.neutralDisabled,
          child: GetBuilder<SignUpControllerImpl>(
            builder: (controller) => CircleAvatar(
              maxRadius: MediaQuery.sizeOf(context).width * .19,
              backgroundImage: controller.selectedImage != null
                  ? FileImage(controller.selectedImage!)
                      as ImageProvider<Object>
                  : const AssetImage(AppImage.placeholder),
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () => controller.showBottomSheet(),
              child: GetBuilder<SignUpControllerImpl>(
                builder: (controller) => AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    decoration: const BoxDecoration(
                        color: AppColor.neutralDisabled,
                        shape: BoxShape.circle),
                    padding: const EdgeInsets.all(10),
                    curve: Curves.ease,
                    child: Icon(
                        controller.selectedImage != null
                            ? EvaIcons.edit
                            : EvaIcons.camera,
                        color: AppColor.blackNeutral,
                        size: 20)),
              ),
            ))
      ],
    );
  }
}
