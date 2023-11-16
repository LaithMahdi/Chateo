import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_screen.dart';

abstract class InitialController extends GetxController {
  changePage(int index);
}

class InitialControllerImpl extends InitialController {
  int _currentPage = 0;
  final List<Widget> _pages = [
    const Text("2"),
    const HomeScreen(),
    const Text("3"),
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
}
