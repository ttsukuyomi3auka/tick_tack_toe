import 'dart:convert';

import 'package:get/get.dart';
import 'package:tick_tack_toe/app/routes/app_pages.dart';
import 'package:tick_tack_toe/models/user.dart';
import 'package:tick_tack_toe/services/auth.dart';
import 'package:tick_tack_toe/services/storage_service.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  StorageService storageService = StorageService();

  @override
  void onInit() async {
    print("зашел в инит");
    super.onInit();
    String? userData = await storageService.read("user");

    if (userData == null || userData.isEmpty) {
      print("1");
      Get.offAndToNamed(Routes.LOGIN);
    } else {
      print("2");
      getBaseAuth(UserResponse.fromJson(jsonDecode(userData)));
      Get.offAndToNamed(Routes.SESSION);
    }
  }

  // @override
  // void onReady() {
  //   super.onReady();
  //   print("ja v on ready");
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
