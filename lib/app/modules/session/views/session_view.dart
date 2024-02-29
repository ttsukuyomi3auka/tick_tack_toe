// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/session_controller.dart';

class SessionView extends GetView<SessionController> {
  SessionView({super.key});

  SessionController sessionController = Get.put(SessionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: sessionController.getSessions(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Ошибка: ${snapshot.error}');
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true, // Добавлено shrinkWrap
                      physics: ClampingScrollPhysics(), // Добавлено physics
                      itemCount: sessionController.sessions.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            "Сессия ${index + 1}",
                            style: TextStyle(
                              color: Color.fromARGB(255, 61, 0, 204),
                            ),
                          ),
                          onTap: () async {
                            await sessionController.getSessionById(
                                sessionController.sessions[index]);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Информация о сессии"),
                                  actions: [
                                    Center(
                                      child: Column(
                                        children: [
                                          Text(
                                              "Имя сессии:${sessionController.currentSession.name}"),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          if (controller
                                                  .currentSession.hostName ==
                                              controller.currentUser.value.user
                                                  .username)
                                            ElevatedButton(
                                                onPressed: () {
                                                  if (sessionController
                                                          .currentSession
                                                          .guestName !=
                                                      null) {
                                                    sessionController
                                                        .startSession();
                                                  } else {
                                                    Get.snackbar("Ошибка",
                                                        "Нет второго игрока");
                                                  }
                                                },
                                                child: Text("Запустить игру"))
                                          else
                                            ElevatedButton(
                                              onPressed: () {
                                                if (sessionController
                                                        .currentSession
                                                        .guestName ==
                                                    null) {
                                                  sessionController.joinSession(
                                                      sessionController
                                                          .currentSession.id);
                                                }
                                              },
                                              child: Text("Подключиться"),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () => sessionController.logout(),
                      child: Text("Сменить пользователя"),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: Text("Создать сессию")),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Сменить никнейм"),
                                  content: TextFormField(
                                    controller:
                                        controller.newUserNicknameController,
                                    decoration: InputDecoration(
                                        labelText: "Новый никнейм"),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text("Отмена"),
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          controller.changeNickname(controller
                                              .newUserNicknameController.text);
                                        },
                                        child: Text("Сохранить")),
                                  ],
                                );
                              },
                            );
                          },
                          child: Text("Сменить никнейм"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Obx(() => Text(
                                "Никнейм: ${sessionController.currentUser.value.user.username}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
