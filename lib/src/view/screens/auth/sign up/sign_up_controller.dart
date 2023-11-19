import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../api/crud.dart';
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
  StatusRequest _statusRequest = StatusRequest.loading;
  UserRemoteData user = UserRemoteData(Crud());
  late TextEditingController _email;
  late TextEditingController _username;
  late TextEditingController _password;
  late TextEditingController _confirmPassword;
  bool _isObscure = true;
  bool _isObscureConf = true;

  File? _selectedImage;

  File? get selectedImage => _selectedImage;

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

  void clearInput() {
    _email.clear();
    _password.clear();
    _username.clear();
    _confirmPassword.clear();
  }

  @override
  void goToLogin() => Get.offAllNamed(AppRoute.login);

  @override
  Future<void> signUp() async {
    _statusRequest = StatusRequest.loading;
    update();
    if (_form.currentState!.validate()) {
      if (_password.text != _confirmPassword.text) {
        showSnackBar(
            "Error", "Confirm password and password are not correct", true);
      } else {
        // try {
        var response = await user.signUpData(
          _username.text,
          _email.text,
          _password.text,
          _selectedImage,
        );
        _statusRequest = handlingData(response);

        if (response["token"] != null) {
          _statusRequest = StatusRequest.success;
          showSnackBar(
              "Success", "Account has been created successfully", false);
          clearInput();
          update();
          Get.offAllNamed(AppRoute.login);
        } else {
          _statusRequest = StatusRequest.failed;
        }
        update();
        // }
        //  catch (e) {
        //   print("Error during sign-up: $e");
        //   showSnackBar("Error", "Something went wrong during sign-up", true);
        // }
      }
    } else {
      showSnackBar("Error", "Form not valid", true);
    }
  }

  Future<void> uploadImage() async {
    try {
      final imagePicker = ImagePicker();
      final pickedImage =
          await imagePicker.pickImage(source: ImageSource.camera);

      if (pickedImage != null) {
        _selectedImage = File(pickedImage.path);
        update();
      } else {
        // User canceled image selection
        // Handle accordingly, e.g., show a message to the user
      }
    } catch (e) {
      // Handle exceptions related to image picking
      print("Error picking image: $e");
      // You can show a snackbar or a dialog to inform the user about the error
    }
  }

  void deleteImage() {
    // Implement logic to delete the selected image
    _selectedImage = null;
    update();
  }

  void updateObscure() {
    _isObscure = !_isObscure;
    update();
  }

  void updateObscureConf() {
    _isObscureConf = !_isObscureConf;
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

// ... The rest of your code ...
