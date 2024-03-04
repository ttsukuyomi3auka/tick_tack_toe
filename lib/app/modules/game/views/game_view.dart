import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tick_tack_toe/app/modules/game/controllers/game_controller.dart';

class GameView extends GetView<GameController> {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
            "${controller.currentSession.value.host_name} VS ${controller.currentSession.value.guest_name}")),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.currentSession.value.host_name ==
                    controller.currentUser.value.user.username) {
                  controller.leaveSession(1);
                } else {
                  controller.leaveSession(2);
                }
              },
              child: Text("Выйти"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
