import 'package:flutter/material.dart';
import '../../../../../core/constant/app_color.dart';

class InitialCardItem extends StatelessWidget {
  final Map<String, dynamic> picture;
  final int index;
  final int currentPage;
  const InitialCardItem(
      {super.key,
      required this.picture,
      required this.index,
      required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: currentPage == index ? 60 : 45,
        // color: Colors.yellow,
        alignment: Alignment.center,
        curve: Curves.bounceInOut,
        child: currentPage == index
            ? Text(
                "${picture["text"]}",
                style: const TextStyle(
                    fontSize: 16,
                    color: AppColor.primary,
                    fontWeight: FontWeight.bold),
              )
            : Icon(
                picture["icon"],
                color: AppColor.primary.withOpacity(0.3),
              ));
  }
}
