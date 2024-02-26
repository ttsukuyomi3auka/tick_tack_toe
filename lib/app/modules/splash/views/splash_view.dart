import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tick_tack_toe/app/routes/app_pages.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SplashView'),
          centerTitle: true,
        ),
        body: Center(
            child: ElevatedButton(
          onPressed: () {
            Get.offAndToNamed(Routes.LOGIN);
          },
          child: Text("login"),
        )));
  }
}
