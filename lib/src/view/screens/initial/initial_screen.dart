import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'initial_controller.dart';
import 'widgets/bottom_navigation_bar_initial.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(InitialControllerImpl());
    return Scaffold(
        body: GetBuilder<InitialControllerImpl>(
          builder: (controller) =>
              controller.pages.elementAt(controller.currentPage),
        ),
        bottomNavigationBar: const BottomNavigationBarInitial());
  }
}
