import 'package:get/get.dart';
import '../../../api/crud.dart';
import '../../../core/constant/app_route.dart';
import '../../../core/enum/statusRequest.dart';
import '../../../core/function/handling_data.dart';
import '../../../data/model/user_model.dart';
import '../../../data/remote/users/user_remote_data.dart';
import '../initial/initial_controller.dart';

abstract class ContactController extends GetxController {
  Future<void> getAllUsers();
  goToPersonalChat(String id, String username);
}

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

  @override
  getAllUsers() async {
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

  @override
  goToPersonalChat(id, username) => Get.toNamed(AppRoute.personalChat,
      arguments: {"id": id, "username": username});
}
