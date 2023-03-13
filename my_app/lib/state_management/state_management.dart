import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_app/state_management/presentation/binding/main_binding.dart';
import 'package:my_app/state_management/presentation/routes/app_pages.dart';
import 'package:my_app/state_management/presentation/routes/app_routes.dart';

class StateManagementPage extends StatelessWidget {
  const StateManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
      initialBinding: MainBinding(),
    );
  }
}