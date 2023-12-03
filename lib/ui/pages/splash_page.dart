import 'package:MyAbsen/theme.dart';
import 'package:MyAbsen/ui/pages/dashboard_page.dart';
import 'package:MyAbsen/ui/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), (() {
      Get.off(DashboardPage());
    }));
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/logo.jpeg',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
