import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../api/crud.dart';
import '../../../../core/constant/app_route.dart';
import '../../../../core/enum/statusRequest.dart';
import '../../../../core/function/handling_data.dart';
import '../../../../core/function/show_snackbar.dart';
import '../../../../core/service/cache_service.dart';
import '../../../../data/remote/users/user_remote_data.dart';

abstract class LoginController extends GetxController {
  void login();
  void forgotPassword();
  void goToSignUp();
}

class LoginControllerImpl extends LoginController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CacheService cacheService = Get.find();
  StatusRequest _statusRequest = StatusRequest.none;
  UserRemoteData user = UserRemoteData(Crud());
  bool _isObscure = true;
  final bool _isDisposed = false;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  // Getter
  bool get obscure => _isObscure;
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get email => _emailController;
  TextEditingController get password => _passwordController;
  StatusRequest get statusRequest => _statusRequest;

  @override
  void onInit() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.onInit();
  }

  void updateObscure() {
    _isObscure = _isObscure ? false : true;
    update();
  }

  @override
  void login() async {
    if (_formKey.currentState!.validate()) {
      var response = await user.signInData(
          _emailController.text, _passwordController.text);
      _statusRequest = handlingData(response);
      if (response["message"] == "success") {
        _statusRequest = StatusRequest.success;
        cacheService.sharedPreferences.setInt("onboard", 2);
        cacheService.sharedPreferences
            .setString("username", response["user"]["username"]);
        cacheService.sharedPreferences
            .setString("email", response["user"]["email"]);
        cacheService.sharedPreferences.setString("id", response["user"]["_id"]);
        cacheService.sharedPreferences.setString("token", response["token"]);
        cacheService.sharedPreferences
            .setString("profilePhoto", response["user"]["profilePhoto"]);
        Get.offNamed(AppRoute.initial);
        clearInput();
        update();
      } else {
        _statusRequest = StatusRequest.failed;
        showSnackBar("Error", "Error ${response["message"]}", true);
      }
      update();
    }
  }

  @override
  void forgotPassword() {
    // TODO: implement forgotPassword
  }

  @override
  void goToSignUp() => Get.offAllNamed(AppRoute.signup);

  void clearInput() {
    if (!_isDisposed) {
      _emailController.clear();
      _passwordController.clear();
    }
  }

  @override
  void onClose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.onClose();
  }
}
