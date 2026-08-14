import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyWorkController extends GetxController {
  final hoveredCardIndex = (-1).obs;

  void setHoveredIndex(int index) {
    hoveredCardIndex.value = index;
  }

  void openLink(String url) {
    debugPrint("Opening URL: $url");
  }
}
