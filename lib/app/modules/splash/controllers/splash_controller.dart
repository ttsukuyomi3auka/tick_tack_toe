import 'dart:convert';

import 'package:get/get.dart';
import 'package:tick_tack_toe/app/routes/app_pages.dart';
import 'package:tick_tack_toe/models/user.dart';
import 'package:tick_tack_toe/services/auth.dart';
import 'package:tick_tack_toe/services/storage_service.dart';

class SplashController extends GetxController {
  StorageService storageService = StorageService();

  @override
  void onInit() async {
    await Future.delayed(Duration(seconds: 3));
    isLogin();
    super.onInit();
  }

  void isLogin() async {
    String? userData = await storageService.read("user");
    print(userData);
    if (userData == null) {
      Get.offAndToNamed(Routes.LOGIN);
    } else {
      getBaseAuth(UserResponse.fromJson(jsonDecode(userData)));
      print(await storageService.read('baseAuth'));
      Get.offAndToNamed(Routes.SESSION);
    }
  }
}
