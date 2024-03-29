import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tick_tack_toe/app/modules/game/controllers/game_controller.dart';

class GameView extends GetView<GameController> {
  const GameView({Key? key});

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
            for (int i = 0; i < 3; i++)
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                for (int j = 0; j < 3; j++)
                  GestureDetector(
                    onTap: () {
                      print(1);
                      controller.updateFields(i, j);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        child: Obx(() {
                          return Text(
                            controller.board['row$i'][j],
                            style: const TextStyle(fontSize: 24),
                          );
                        }),
                      ),
                    ),
                  ),
              ]),
            const SizedBox(
              height: 50,
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
              child: const Text("Выйти"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
