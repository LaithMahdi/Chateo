import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../core/constant/app_color.dart';
import '../../../../../core/constant/app_image.dart';
import '../../../../../core/constant/app_size.dart';
import '../../../../../core/function/valid_input.dart';
import '../../../../../shared/spacer/vertical_spacer.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/auth_text_link.dart';
import '../../widgets/auth_title.dart';
import '../../widgets/input.dart';
import '../../widgets/label.dart';
import '../login_controller.dart';

class LoginViewBody extends GetView<LoginControllerImpl> {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        children: [
          const AuthTitle("Enter your credentials to Log In your account"),
          Center(
              child: SvgPicture.asset(AppImage.login,
                  width: AppSize.screenHeight! * .3)),
          const Label("Email :"),
          Input(
            hintText: "Email",
            controller: controller.email,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => validInput(value!, 6, 75, "email"),
          ),
          const Label("Password :"),
          GetBuilder<LoginControllerImpl>(
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
          const VerticalSpacer(1),
          const Align(
            alignment: Alignment.topRight,
            child: Text(
              "Forgot Password ?",
              style: TextStyle(
                  color: AppColor.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ),
          const VerticalSpacer(2),
          AuthButton(text: "Sign up", onPressed: () => controller.login()),
          const VerticalSpacer(4),
          AuthTextLink("You don't have an account ? ", "Sign up",
              () => controller.goToSignUp()),
          const VerticalSpacer(1),
        ],
      ),
    );
  }
}
