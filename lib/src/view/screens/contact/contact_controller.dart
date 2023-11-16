import 'package:chateo/src/api/crud.dart';
import 'package:chateo/src/core/enum/statusRequest.dart';
import 'package:chateo/src/data/remote/users/user_remote_data.dart';
import 'package:chateo/src/view/screens/initial/initial_controller.dart';
import 'package:get/get.dart';

import '../../../core/function/handling_data.dart';
import '../../../data/model/user_model.dart';

abstract class ContactController extends GetxController {}

class ContactControllerImpl extends ContactController {
  StatusRequest _statusRequest = StatusRequest.loading;
  InitialControllerImpl initial = Get.find();
  UserRemoteData user = UserRemoteData(Crud());
  List<UserModel> users = [];
//Getter
  StatusRequest get statusRequest => _statusRequest;
  @override
  void onInit() {
    getAllUsers();
    super.onInit();
  }

  Future<void> getAllUsers() async {
    var response = await user.getAllUsers(initial.token!);
    _statusRequest = handlingData(response);
    if (_statusRequest == StatusRequest.success) {
      if (response["users"] is List) {
        users.addAll(List.generate(response["users"].length,
            (index) => UserModel.fromJson(response["users"][index])));
      } else {
        _statusRequest = StatusRequest.failed;
      }
      update();
    }
  }
}
