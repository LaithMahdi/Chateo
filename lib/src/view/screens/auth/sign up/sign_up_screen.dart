import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sign_up_controller.dart';
import 'widgets/sign_up_view_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: const SignUpViewBody(),
    );
  }
}
