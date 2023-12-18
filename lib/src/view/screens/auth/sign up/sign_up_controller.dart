import 'dart:io';

import 'package:chateo/src/core/constant/app_color.dart';
import 'package:chateo/src/core/constant/app_size.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
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
  StatusRequest _statusRequest = StatusRequest.none;
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
        _statusRequest = StatusRequest.failed;
      } else if (_selectedImage == null) {
        showSnackBar("Error", "Image has not picked", true);
        _statusRequest = StatusRequest.failed;
      } else {
        var response = await user.signUpData(
            _username.text, _email.text, _password.text, _selectedImage);
        _statusRequest = handlingData(response);

        if (response["token"] != null) {
          _statusRequest = StatusRequest.success;
          showSnackBar(
              "Success", "Account has been created successfully", false);
          clearInput();
          Get.offAllNamed(AppRoute.login);
          update();
        } else {
          showSnackBar("Failed", "Account hasen't created", true);
          _statusRequest = StatusRequest.failed;
        }
        update();
      }
    } else {
      showSnackBar("Error", "Form not valid", true);
      _statusRequest = StatusRequest.failed;
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
      }
    } catch (e) {
      print("Error picking image: $e");
    }
    Get.back();
  }

  void deleteImage() {
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

  Future<void> uploadImageFromGallery() async {
    try {
      final imagePicker = ImagePicker();
      final pickedImage =
          await imagePicker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        _selectedImage = File(pickedImage.path);
        update();
      }
    } catch (e) {
      print("Error picking image: $e");
    }
    Get.back();
  }

  showBottomSheet() {
    Get.bottomSheet(
        SizedBox(
          height: AppSize.screenHeight! * .15,
          child: Row(
            children: [
              Expanded(
                  child: GestureDetector(
                child: const Icon(EvaIcons.camera, size: 30),
                onTap: () => uploadImage(),
              )),
              Expanded(
                  child: GestureDetector(
                child: const Icon(Icons.photo_library, size: 30),
                onTap: () => uploadImageFromGallery(),
              )),
            ],
          ),
        ),
        backgroundColor: AppColor.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(10))));
  }
}
