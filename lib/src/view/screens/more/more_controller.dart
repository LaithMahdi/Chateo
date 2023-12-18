import 'package:chateo/src/api/crud.dart';
import 'package:chateo/src/core/enum/statusRequest.dart';
import 'package:chateo/src/core/service/cache_service.dart';
import 'package:chateo/src/data/remote/users/user_remote_data.dart';
import 'package:chateo/src/view/screens/initial/initial_controller.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_route.dart';
import '../../../core/function/handling_data.dart';

abstract class MoreController extends GetxController {
  Future<void> logout();
}

class MoreControllerImpl extends MoreController {
  StatusRequest _statusRequest = StatusRequest.success;
  UserRemoteData user = UserRemoteData(Crud());
  InitialControllerImpl initial = Get.find();
  CacheService cacheService = Get.find();

  // Getter
  StatusRequest get statusRequest => _statusRequest;
  viewProfil() => print("view profil");

  @override
  Future<void> logout() async {
    var response = await user.logout();
    _statusRequest = handlingData(response);
    if (response["message"] == "Logout successful") {
      _statusRequest = StatusRequest.success;
      cacheService.sharedPreferences.setInt("onboard", 1);
      cacheService.sharedPreferences.setString("username", "");
      cacheService.sharedPreferences.setString("email", "");
      cacheService.sharedPreferences.setString("id", "");
      cacheService.sharedPreferences.setString("token", "");
      cacheService.sharedPreferences.setString("profilePhoto", "");
      Get.offAllNamed(AppRoute.login);

      update();
    } else {
      _statusRequest = StatusRequest.failed;
    }
    update();
  }

  changeApperance() {
    // _themeController.toggleTheme();
    // print(_themeController.themeMode);
  }
}
