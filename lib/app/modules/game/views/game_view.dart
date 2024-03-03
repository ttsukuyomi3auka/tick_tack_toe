import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/game_controller.dart';

class GameView extends GetView<GameController> {
  const GameView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text("${controller.currentSession.value.host_name} VS ${controller.currentSession.value.guest_name}")),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GameView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
