import 'package:chateo/src/core/constant/app_color.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBar(
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
    );
  }
}
