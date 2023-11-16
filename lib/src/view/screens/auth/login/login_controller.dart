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
  StatusRequest _statusRequest = StatusRequest.loading;
  final UserRemoteData user = UserRemoteData(Crud());
  bool _isObscure = true;
  late TextEditingController _email;
  late TextEditingController _password;

  // Getter
  bool get obscure => _isObscure;
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get email => _email;
  TextEditingController get password => _password;
  StatusRequest get statusRequest => _statusRequest;

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
  void login() async {
    if (_formKey.currentState!.validate()) {
      var response = await user.signInData(email.text, password.text);
      _statusRequest = handlingData(response);
      if (response["token"] != null) {
        _statusRequest = StatusRequest.success;
        cacheService.sharedPreferences.setInt("onboard", 2);
        cacheService.sharedPreferences
            .setString("username", response["user"]["username"]);
        cacheService.sharedPreferences
            .setString("email", response["user"]["email"]);
        cacheService.sharedPreferences.setString("id", response["user"]["_id"]);
        cacheService.sharedPreferences.setString("token", response["token"]);
        Get.offAllNamed(AppRoute.initial);
        clearInput();
        update();
      } else if (response["message"] != null) {
        showSnackBar("Error", "Error ${response["message"]}", true);
      } else {
        _statusRequest = StatusRequest.failed;
      }
      update();
    } else {
      showSnackBar("Error", "Account has created with successfully", true);
    }
  }

  @override
  void forgotPassword() {
    // TODO: implement forgotPassword
  }

  @override
  void goToSignUp() => Get.toNamed(AppRoute.signup);

  clearInput() {
    _email.clear();
    _password.clear();
  }

  @override
  void onClose() {
    _email.dispose();
    _password.dispose();
    super.onClose();
  }
}
