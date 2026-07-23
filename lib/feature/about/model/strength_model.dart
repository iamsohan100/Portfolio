import 'package:flutter/material.dart';

class StrengthModel {
  final String title;
  final IconData icon;

  const StrengthModel({required this.title, required this.icon});
}


const List<StrengthModel> strengths = [
  StrengthModel(
    title: "Flutter & Dart Expertise",
    icon: Icons.flutter_dash_outlined,
  ),
  StrengthModel(
    title: "Cross-Platform Development",
    icon: Icons.devices_outlined,
  ),
  StrengthModel(title: "Clean Architecture", icon: Icons.account_tree_outlined),
  StrengthModel(title: "MVVM Architecture", icon: Icons.schema_outlined),
  StrengthModel(title: "RESTful API Integration", icon: Icons.api_outlined),
  StrengthModel(title: "State Management (GetX)", icon: Icons.tune_outlined),
  StrengthModel(
    title: "Firebase Integration",
    icon: Icons.local_fire_department_outlined,
  ),
  StrengthModel(title: "WebSocket Communication", icon: Icons.sync_outlined),
  StrengthModel(
    title: "Third-Party SDK Integration",
    icon: Icons.extension_outlined,
  ),
  StrengthModel(
    title: "Responsive UI Design",
    icon: Icons.phone_android_outlined,
  ),
  StrengthModel(title: "Performance Optimization", icon: Icons.speed_outlined),
  StrengthModel(
    title: "Scalable & Maintainable Code",
    icon: Icons.code_outlined,
  ),
  StrengthModel(title: "Reusable Widget Design", icon: Icons.widgets_outlined),
  StrengthModel(title: "Strong Problem Solving", icon: Icons.lightbulb_outline),
  StrengthModel(
    title: "Detail-Oriented Development",
    icon: Icons.search_outlined,
  ),
  StrengthModel(
    title: "Ownership Mindset",
    icon: Icons.workspace_premium_outlined,
  ),
  StrengthModel(title: "Continuous Learning", icon: Icons.menu_book_outlined),
  StrengthModel(
    title: "Strong Debugging Skills",
    icon: Icons.bug_report_outlined,
  ),
  StrengthModel(title: "Clear Communication", icon: Icons.chat_bubble_outline),
  StrengthModel(title: "Team Collaboration", icon: Icons.groups_outlined),
];
