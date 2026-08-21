import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohan/core/constants/web_images.dart';
import 'package:sohan/feature/certificates/model/certificate_model.dart';
import 'package:url_launcher/url_launcher.dart';

class CertificationsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final currentIndex = 0.obs;
  Timer? _timer;
  final GlobalKey certKey = GlobalKey();
  bool _hasAnimated = false;

  late AnimationController animationController;
  late Animation<double> titleFadeAnimation;
  late Animation<double> titleScaleAnimation;
  late Animation<Offset> titleSlideAnimation;

  final List<CertificateModel> certificates = [
    CertificateModel(
      title: "App Development With Flutter",
      issuer: "Ostad",
      issueDate: "April, 2024",
      description:
          "I completed professional training in Flutter app development, where I built a strong foundation in Dart, Flutter, UI development, state management, API integration, and mobile application architecture. This certification marks an important step in my journey from learning Flutter to using it to build real-world applications.",
      imagePath: WebImages.certificate,
      driveUrl:
          "https://drive.google.com/file/d/1ccWFftoKu5VE4SGwvp2P0aHSfXdQGU0j/view?usp=sharing",
    ),
    CertificateModel(
      title: "Flutter Development Assessment",
      issuer: "Ostad",
      issueDate: "April, 2024",
      description:
          "My Flutter development skills were evaluated through assignments, quizzes, live tests, and coding challenges, where I achieved consistently strong results. These assessments helped strengthen my problem-solving abilities and gave me practical experience in applying Flutter development concepts.",
      imagePath: WebImages.markSheet,
      driveUrl:
          "https://drive.google.com/file/d/1fc1R1kgK4BJDC7iGo0ikkwXCiz_sRefB/view?usp=sharing",
    ),
  ];

  CertificateModel get currentCertificate => certificates[currentIndex.value];

  @override
  void onInit() {
    super.onInit();
    startAutoSlide();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );

    titleFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
      ),
    );

    titleScaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeOutCubic),
      ),
    );

    titleSlideAnimation =
        Tween<Offset>(begin: const Offset(0.0, 0.2), end: Offset.zero).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(0.0, 1.0, curve: Curves.easeOutCubic),
          ),
        );
  }

  void checkVisibility(BuildContext context) {
    if (_hasAnimated) return;
    final renderBox = certKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null && renderBox.hasSize) {
      final position = renderBox.localToGlobal(Offset.zero);
      final screenHeight = MediaQuery.of(context).size.height;

      if (position.dy < screenHeight * 0.90) {
        _hasAnimated = true;
        animationController.forward(from: 0.0);
      }
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    animationController.dispose();
    super.onClose();
  }

  void startAutoSlide() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      nextCertificate(isAuto: true);
    });
  }

  void resetAutoSlide() {
    startAutoSlide();
  }

  void nextCertificate({bool isAuto = false}) {
    if (certificates.isEmpty) return;
    currentIndex.value = (currentIndex.value + 1) % certificates.length;
    if (!isAuto) {
      resetAutoSlide();
    }
  }

  void previousCertificate() {
    if (certificates.isEmpty) return;
    currentIndex.value =
        (currentIndex.value - 1 + certificates.length) % certificates.length;
    resetAutoSlide();
  }

  void selectCertificate(int index) {
    if (index >= 0 && index < certificates.length) {
      currentIndex.value = index;
      resetAutoSlide();
    }
  }

  Future<void> openCertificateLink(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(uri);
      }
    } catch (e) {
      debugPrint("Could not launch certificate URL: $e");
    }
  }
}
