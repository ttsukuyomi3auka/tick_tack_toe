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
                          onTap: () {
                            sessionController.getSessionById(
                                sessionController.sessions[index]);
                            if (sessionController.currentSession != null) {
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
                                            //тута проверку кто я хост или залетный типок
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
                            } else {
                              print(sessionController.currentSession);
                            }
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
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
