import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/web_icons.dart';

class TechItem {
  final String? label;
  final String? iconPath;

  const TechItem({this.label, this.iconPath});
}

class WorkModel {
  final String title;
  final String description;
  final String? githubUrl;
  final bool hasAndroid;
  final bool hasIos;
  final Color bannerBgColor;
  final String? imagePath;
  final List<TechItem> techStack;

  const WorkModel({
    required this.title,
    required this.description,
    this.githubUrl = "https://github.com",
    this.hasAndroid = true,
    this.hasIos = true,
    required this.bannerBgColor,
    this.imagePath,
    required this.techStack,
  });
}

const List<WorkModel> workList = [
  WorkModel(
    title: "Wisper Backend",
    githubUrl: "https://github.com",
    hasAndroid: true,
    hasIos: true,
    bannerBgColor: Color(0xFF141416),
    description:
        "Wisper is a professional networking platform that connects job seekers, recruiters, and industry experts. This backend p...",
    techStack: [
      TechItem(label: "TS"),
      TechItem(label: "ex"),
      TechItem(iconPath: WebIcons.api),
      TechItem(label: "PR"),
      TechItem(label: "JWT"),
      TechItem(label: "aws"),
    ],
  ),
  WorkModel(
    title: "Academianow Server",
    githubUrl: "https://github.com",
    hasAndroid: true,
    hasIos: true,
    bannerBgColor: Color(0xFF163E2B),
    description:
        "AcademiaNow is an educational platform designed for students aged 12-17, focusing initially on Geography, with plans to ...",
    techStack: [
      TechItem(label: "TS"),
      TechItem(label: "PR"),
      TechItem(iconPath: WebIcons.api),
      TechItem(label: "aws"),
      TechItem(label: "ex"),
      TechItem(label: "JS"),
    ],
  ),
  WorkModel(
    title: "Yalla Coupon Server",
    githubUrl: "https://github.com",
    hasAndroid: true,
    hasIos: true,
    bannerBgColor: Color(0xFFE5D5E1),
    description:
        "Backend server powering coupon discovery, management, user accounts, stores, notifications, and admin operations. Built ...",
    techStack: [
      TechItem(label: "TS"),
      TechItem(label: "aws"),
      TechItem(label: "JS"),
      TechItem(iconPath: WebIcons.firebase),
      TechItem(label: "MD"),
      TechItem(iconPath: WebIcons.api),
    ],
  ),
  WorkModel(
    title: "School Resource Exchange App - Backend",
    githubUrl: "https://github.com",
    hasAndroid: true,
    hasIos: true,
    bannerBgColor: Color(0xFFEBECEE),
    description:
        "A comprehensive backend solution built for school resource sharing, item exchanges, real-time messaging, and user management.",
    techStack: [
      TechItem(iconPath: WebIcons.flutter),
      TechItem(iconPath: WebIcons.dart),
      TechItem(iconPath: WebIcons.firebase),
      TechItem(label: "Node"),
      TechItem(label: "EX"),
    ],
  ),
  WorkModel(
    title: "Furry Cares 🐾",
    githubUrl: "https://github.com",
    hasAndroid: true,
    hasIos: true,
    bannerBgColor: Color(0xFF202028),
    description:
        "Pet care and puppy growth tracking platform providing health guides, nutrition details, and veterinarian support.",
    techStack: [
      TechItem(iconPath: WebIcons.flutter),
      TechItem(iconPath: WebIcons.api),
      TechItem(label: "JS"),
      TechItem(label: "React"),
      TechItem(label: "Tailwind"),
    ],
  ),
  WorkModel(
    title: "Global8 Dashboard",
    githubUrl: "https://github.com",
    hasAndroid: true,
    hasIos: true,
    bannerBgColor: Color(0xFF181822),
    description:
        "Global IT Dashboard for tracking real-time server metrics, customer growth analytics, active deployments, and operational logs.",
    techStack: [
      TechItem(label: "Next"),
      TechItem(label: "TS"),
      TechItem(label: "Redux"),
      TechItem(iconPath: WebIcons.api),
      TechItem(label: "AWS"),
    ],
  ),
];
