import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/service/cache_service.dart';
import '../contact/contact_screen.dart';
import '../home/home_screen.dart';
import '../more/more_screen.dart';

abstract class InitialController extends GetxController {
  changePage(int index);
}

class InitialControllerImpl extends InitialController {
  int _currentPage = 0;
  CacheService cacheService = Get.find();
  late String? username;
  late String? email;
  late String? id;
  late String? token;
  late String? profilePhoto;

  final List<Widget> _pages = [
    const ContactScreen(),
    const HomeScreen(),
    const MoreScreen(),
  ];
  final List<Map<String, dynamic>> _items = [
    {
      "text": "Users",
      "icon": EvaIcons.peopleOutline,
    },
    {
      "text": "Chat",
      "icon": EvaIcons.messageCircle,
    },
    {
      "text": "More",
      "icon": EvaIcons.moreHorizontal,
    }
  ];
  // Getter
  int get currentPage => _currentPage;
  List<Widget> get pages => _pages;
  List<Map<String, dynamic>> get items => _items;
  @override
  changePage(index) {
    _currentPage = index;
    update();
  }

  @override
  void onInit() async {
    username = cacheService.sharedPreferences.getString("username");
    email = cacheService.sharedPreferences.getString("email");
    id = cacheService.sharedPreferences.getString("id");
    token = cacheService.sharedPreferences.getString("token");
    profilePhoto = cacheService.sharedPreferences.getString("profilePhoto");
    print(
        "username: ${username!} email: ${email!} id: ${id!} token: ${token!}");
    super.onInit();
  }
}
