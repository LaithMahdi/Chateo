import 'package:chateo/src/core/constant/app_color.dart';
import 'package:chateo/src/view/screens/home/home_controller.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Chats",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  EvaIcons.messageSquare,
                  color: AppColor.neutralDisabled,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  EvaIcons.options2,
                  color: AppColor.neutralDisabled,
                )),
          ],
        ),
        body: Column(
          children: [
            GetBuilder<HomeController>(
              builder: (controller) => AnimatedContainer(
                alignment: homeController.align,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeIn,
                child: LottieBuilder.asset(
                  "assets/images/plane.json",
                  width: 250,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => homeController.animate(),
              child: const Text("animated"),
            )
          ],
        ));
  }
}
