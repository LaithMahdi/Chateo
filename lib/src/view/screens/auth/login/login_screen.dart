import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller.dart';
import 'widgets/Login_view_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: const LoginViewBody(),
    );
  }
}
