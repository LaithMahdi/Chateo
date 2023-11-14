import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  void login();
  void forgotPassword();
  void goToSignUp();
}

class LoginControllerImpl extends LoginController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  late TextEditingController _email;
  late TextEditingController _password;

  // Getter
  bool get obscure => _isObscure;
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get email => _email;
  TextEditingController get password => _password;

  @override
  void onInit() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.onInit();
  }

  void updateObscure() {
    _isObscure = _isObscure ? false : true;
    update();
  }

  @override
  void login() {
    if (_formKey.currentState!.validate()) {
      print("success");
    } else {
      print("error");
    }
  }

  @override
  void forgotPassword() {
    // TODO: implement forgotPassword
  }

  @override
  void goToSignUp() {
    // TODO: implement goToSingUp
  }
}
