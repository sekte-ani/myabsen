import 'package:MyAbsen/controller/profile_controller.dart';
import 'package:MyAbsen/theme.dart';
import 'package:MyAbsen/ui/pages/profile/profile_edit_page.dart';
import 'package:MyAbsen/ui/pages/profile/profile_reset_page.dart';
import 'package:MyAbsen/ui/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          "Profile Saya",
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.symmetric(
              horizontal: 54,
              vertical: 37,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: whiteColor,
              boxShadow: [themeShadow],
            ),
            child: Column(
              children: [
                Container(
                  width: 144,
                  height: 144,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.account_circle,
                    color: blackColor,
                    size: 144,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Aldi Taher',
                  style: font_semiBold.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ProfileMenuItem(
                  iconUrl: Icons.account_circle_outlined,
                  title: "Edit Profile",
                  onTap: () {
                    Get.to(() => ProfileEditPage());
                  },
                ),
                ProfileMenuItem(
                  iconUrl: Icons.shield_outlined,
                  title: "Reset Password",
                  onTap: () {
                    Get.to(ProfileResetPage());
                  },
                ),
                ProfileMenuItem(
                  iconUrl: Icons.logout,
                  title: "Log out",
                  textColor: redColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
