import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  AlignmentGeometry align = Alignment.centerLeft;
  double width = 150;
  void animate() {
    align = align == Alignment.centerLeft
        ? Alignment.centerRight
        : Alignment.centerLeft;

    update();
  }
}
