import 'package:assessment_tracker/controllers/auth_controller.dart';
import 'package:assessment_tracker/pages/home_page.dart';
import 'package:assessment_tracker/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Authenticate extends StatelessWidget {
  Authenticate({super.key});

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return authController.user.value != null ? HomePage() : const LoginPage();
    });
  }
}
