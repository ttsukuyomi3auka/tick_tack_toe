import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/session_controller.dart';

class SessionView extends GetView<SessionController> {
  SessionView({super.key});

  SessionController sessionController = Get.put(SessionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SessionView'),
        centerTitle: true,
      ),
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: sessionController.sessions.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            "Сессия ${index + 1}",
                            style: TextStyle(
                                color: Color.fromARGB(255, 61, 0, 204)),
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
                                      content: Text(
                                          "Имя сесии:${sessionController.currentSession.name}"),
                                    );
                                  });
                            } else {
                              print(sessionController.currentSession);
                            }
                          },
                        );
                      },
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
