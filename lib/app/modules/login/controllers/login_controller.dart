import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tick_tack_toe/app/routes/app_pages.dart';
import 'package:tick_tack_toe/services/network_services.dart';

class LoginController extends GetxController {
  NetworkServices networkServices = NetworkServices();
  final usernameController = TextEditingController();

  void login() async {
    if (await networkServices.addUser(usernameController.text)) {
      Get.offAndToNamed(Routes.SESSION);
    } else {
      Get.snackbar("Ошибка", "Не удалось войти", backgroundColor: Colors.red);
    }
  }
}
