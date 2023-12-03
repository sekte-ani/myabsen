import 'package:MyAbsen/theme.dart';
import 'package:MyAbsen/ui/widgets/buttons.dart';
import 'package:MyAbsen/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileResetPage extends StatelessWidget {
  const ProfileResetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: whiteColor,
        ),
        title: Text(
          'Reset Password',
          style: font_semiBold.copyWith(
            color: whiteColor,
          ),
        ),
        backgroundColor: green2Color,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: green2Color,
            ),
          ),
          ListView(
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(27),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    InputField(
                      title: "Password Lama",
                      hintText: "Masukkan password lama anda..",
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputField(
                      title: "Password Baru",
                      hintText: "Masukkan password baru anda..",
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputField(
                      title: "Konfirmasi Password",
                      hintText: "Masukkan ulang password baru..",
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    PrimaryButton(
                      title: "Ubah Password",
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
