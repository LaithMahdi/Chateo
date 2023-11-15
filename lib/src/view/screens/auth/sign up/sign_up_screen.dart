import 'package:chateo/src/core/enum/statusRequest.dart';
import 'package:chateo/src/view/screens/auth/sign%20up/sign_up_controller.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/app_color.dart';
import '../../../../core/function/valid_input.dart';
import '../../../../shared/spacer/vertical_spacer.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_text_link.dart';
import '../widgets/auth_title.dart';
import '../widgets/input.dart';
import '../widgets/label.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImpl controller = Get.put(SignUpControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Form(
          key: controller.form,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            children: [
              const AuthTitle(
                  "Enter information to create your account with us"),
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
                        ? const Center(child: CircularProgressIndicator())
                        : AuthButton(
                            text: "Sign up",
                            onPressed: () => controller.signUp()),
              ),
              const VerticalSpacer(9),
              AuthTextLink("You Already have an account ? ", "Sign in", () {}),
              const VerticalSpacer(1),
            ],
          )),
    );
  }
}
