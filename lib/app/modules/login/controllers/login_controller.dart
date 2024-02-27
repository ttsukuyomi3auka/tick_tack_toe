import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tick_tack_toe/app/routes/app_pages.dart';
import 'package:tick_tack_toe/core/constants.dart';
import 'package:tick_tack_toe/models/user.dart';
import 'package:tick_tack_toe/services/auth.dart';
import 'package:tick_tack_toe/services/storage_service.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  StorageService storageService = StorageService();
  final usernameController = TextEditingController();
  var httpClient = Dio();
  late UserResponse currentUser;

  @override
  void onInit() {
    super.onInit();
  }

  void login() async {
    try {
      var response =
          await httpClient.post('$baseUrl/user/add/${usernameController.text}');
      if (response.statusCode == 200) {
        currentUser = UserResponse.fromJson(response.data);
        await storageService.write("user", currentUser);
        print(await storageService.read("user"));
        getBaseAuth(currentUser);
        Get.offAndToNamed(Routes.SESSION);
      } else {
        Exception("Не удалось войти");
      }
    } catch (error) {
      print('Ошибка входа: $error');
    }
  }
}
