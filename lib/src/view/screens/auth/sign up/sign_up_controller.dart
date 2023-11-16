import 'package:chateo/src/api/crud.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../core/constant/app_route.dart';
import '../../../../core/enum/statusRequest.dart';
import '../../../../core/function/handling_data.dart';
import '../../../../core/function/show_snackbar.dart';
import '../../../../data/remote/users/user_remote_data.dart';

abstract class SignUpController extends GetxController {
  void signUp();
  void goToLogin();
}

class SignUpControllerImpl extends SignUpController {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  StatusRequest _statusRequest = StatusRequest.success;
  UserRemoteData user = UserRemoteData(Crud());
  late TextEditingController _email;
  late TextEditingController _username;
  late TextEditingController _password;
  late TextEditingController _confirmPassword;
  bool _isObscure = true;
  bool _isObscureConf = true;

  // Getter
  TextEditingController get email => _email;
  TextEditingController get username => _username;
  TextEditingController get password => _password;
  TextEditingController get confirmPassword => _confirmPassword;
  GlobalKey<FormState> get form => _form;
  bool get obscure => _isObscure;
  bool get obscureConf => _isObscureConf;
  StatusRequest get statusRequest => _statusRequest;

  @override
  void onInit() {
    _email = TextEditingController();
    _username = TextEditingController();
    _password = TextEditingController();
    _confirmPassword = TextEditingController();
    super.onInit();
  }

  clearInput() {
    _email.clear();
    _password.clear();
    _username.clear();
    _confirmPassword.clear();
  }

  @override
  void goToLogin() => Get.offAllNamed(AppRoute.login);

  @override
  void signUp() async {
    _statusRequest = StatusRequest.loading;
    update();
    if (_form.currentState!.validate()) {
      if (_password.text != _confirmPassword.text) {
        showSnackBar(
            "Error", "Confirm password and password are not corects ", true);
      } else {
        var response =
            await user.signUpData(username.text, email.text, password.text);
        _statusRequest = handlingData(response);
        if (response["token"] != null) {
          _statusRequest = StatusRequest.success;
          showSnackBar(
              "Success", "Account has created with successfully", false);
          clearInput();
          update();
          Get.offAllNamed(AppRoute.login);
        } else {
          _statusRequest = StatusRequest.failed;
        }
        update();
      }
    } else {
      showSnackBar("Error", "Form not valid", true);
    }
  }

  void updateObscure() {
    _isObscure = _isObscure ? false : true;
    update();
  }

  void updateObscureConf() {
    _isObscureConf = _isObscureConf ? false : true;
    update();
  }

  @override
  void onClose() {
    _email.dispose();
    _username.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.onClose();
  }
}
