import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottom_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const routeName = '/SplashScreen';

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
      Get.offNamed(BottomPage.routeName);
    });
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "asset/images/2.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
