import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const routeName = '/SplashScreen';

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
      Get.offNamed(HomePage.routeName);
    });
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "asset/images/home_images/image_2024_09_06T07_26_23_682Z.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
