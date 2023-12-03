import 'package:MyAbsen/controller/dashboard_controller.dart';
import 'package:MyAbsen/theme.dart';
import 'package:MyAbsen/ui/pages/absensi/absensi_page.dart';
import 'package:MyAbsen/ui/pages/history/history_page.dart';
import 'package:MyAbsen/ui/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                AbsensiPage(),
                HistoryPage(),
                ProfilePage(),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            height: 74,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: blackColor.withOpacity(0.15),
                  offset: Offset(0, -1),
                  blurRadius: 37,
                ),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: controller.tabIndex,
              onTap: controller.changeTabIndex,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: darkGreyColor,
              selectedItemColor: greenColor,
              backgroundColor: whiteColor,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              selectedLabelStyle: font_semiBold.copyWith(
                fontSize: 12,
              ),
              unselectedLabelStyle: font_medium.copyWith(
                fontSize: 12,
              ),
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      bottom: 3,
                    ),
                    child: Icon(
                      Icons.calendar_month,
                      size: 20,
                      color:
                          controller.tabIndex == 0 ? greenColor : darkGreyColor,
                    ),
                  ),
                  label: 'Absensi',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      bottom: 3,
                    ),
                    child: Icon(
                      Icons.description,
                      size: 20,
                      color:
                          controller.tabIndex == 1 ? greenColor : darkGreyColor,
                    ),
                  ),
                  label: 'Riwayat',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      bottom: 3,
                    ),
                    child: Icon(
                      Icons.account_circle,
                      size: 20,
                      color:
                          controller.tabIndex == 2 ? greenColor : darkGreyColor,
                    ),
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
