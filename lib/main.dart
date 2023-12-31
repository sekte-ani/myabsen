import 'package:MyAbsen/controller/bindings/dashboard_binding.dart';
import 'package:MyAbsen/theme.dart';
import 'package:MyAbsen/ui/pages/dashboard_page.dart';
import 'package:MyAbsen/ui/pages/login_page.dart';
import 'package:MyAbsen/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: font_semiBold.copyWith(
            fontSize: 18,
          ),
        ),
      ),
      home: SplashPage(),
      initialBinding: DashboardBinding(),
    );
  }
}
