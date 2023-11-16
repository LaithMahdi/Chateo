import 'package:chateo/src/view/screens/more/more_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/more_view_body.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MoreControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: const Text("More",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
      ),
      body: const MoreViewBody(),
    );
  }
}
