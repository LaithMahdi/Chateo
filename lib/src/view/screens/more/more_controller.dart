import 'package:chateo/src/view/screens/initial/initial_controller.dart';
import 'package:get/get.dart';

abstract class MoreController extends GetxController {}

class MoreControllerImpl extends MoreController {
  InitialControllerImpl initial = Get.find();
  viewProfil() => print("view profil");
}
