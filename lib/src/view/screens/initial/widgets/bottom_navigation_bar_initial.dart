import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/app_color.dart';
import '../initial_controller.dart';
import 'components/initial_card_item.dart';

class BottomNavigationBarInitial extends GetView<InitialControllerImpl> {
  const BottomNavigationBarInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(color: AppColor.white, boxShadow: [
        BoxShadow(
          offset: const Offset(6, -4),
          color: AppColor.primary.withOpacity(0.05),
          spreadRadius: 4,
          blurRadius: 5,
        )
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...List.generate(
              controller.items.length,
              (index) => GestureDetector(
                    onTap: () => controller.changePage(index),
                    child: GetBuilder<InitialControllerImpl>(
                      builder: (controller) => InitialCardItem(
                          picture: controller.items[index],
                          index: index,
                          currentPage: controller.currentPage),
                    ),
                  ))
        ],
      ),
    );
  }
}
