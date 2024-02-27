import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tick_tack_toe/core/constants.dart';
import 'package:tick_tack_toe/models/session.dart';
import 'package:tick_tack_toe/services/storage_service.dart';

class SessionController extends GetxController {
  //TODO: Implement SessionController
  Dio httpClient = Dio();
  late SessionResponse currentSession;
  StorageService storageService = StorageService();

  RxList<String> sessions = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  // POST /session/create/:НазваниеСессии
  Future<void> createSession(String sessionName) async {}

  // PATCH /session/start
  Future<void> startSession() async {}

  // GET /session/get
  Future<void> getSessions() async {
    try {
      var response = await httpClient.get('$baseUrl/session/get');
      if (response.statusCode == 200) {
        List<dynamic> sessionsData = response.data;
        sessions.assignAll(sessionsData.cast<String>());
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print("Ошибка: $e");
    }
  }

  //GET /session/get/:ИДСессии
  Future<void> getSessionById(String sessionId) async {
    try {
      var response = await httpClient.get('$baseUrl/session/get/$sessionId');
      currentSession = SessionResponse.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }

  // PATCH /session/join/:ИДСессии
  Future<void> joinSession(String sessionId) async {
    String? baseAuth = await storageService.read('baseAuth');

    if (baseAuth != null) {
      var response = await httpClient.post('$baseUrl/session/join/$sessionId',
          options: Options(headers: <String, String>{
            'authorization': baseAuth,
          }));
      if (response.statusCode == 200) {
        //нужно внести измениния в сессию
      } else {
        print("Не удалось подключиться");
      }
    } else {
      // Обработка случая, когда baseAuth равен null
      print('Ошибка: baseAuth равен null');
    }
  }

  // DELETE /session/leave
  Future<void> leaveSession() async {}

  // PATCH /user/update сменить никнейм кнопочка
}
