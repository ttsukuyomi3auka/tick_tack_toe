import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tick_tack_toe/app/routes/app_pages.dart';
import 'package:tick_tack_toe/models/session.dart';
import 'package:tick_tack_toe/models/user.dart';
import 'package:tick_tack_toe/services/network_services.dart';
import 'package:tick_tack_toe/services/storage_service.dart';

class SessionController extends GetxController {
  StorageService storageService = StorageService();
  NetworkServices networkServices = NetworkServices();
  RxList<String> sessions = <String>[].obs;
  SessionResponse currentSession = SessionResponse();
  final newUserNicknameController = TextEditingController();
  Rx<UserResponse> currentUser = UserResponse(user: User()).obs;

  
  @override
  void onInit() async {
    updateLocalData();
    super.onInit();
  }
  Future<void> updateLocalData() async{
    currentUser.value= await storageService.readUserResponse('user');
  }

  // POST /session/create/:НазваниеСессии
  Future<void> createSession(String sessionName) async {}

  // PATCH /session/start
  Future<void> startSession() async {}

  Future<void> getSessions() async {
    List<dynamic>? sessionsData = await networkServices.getSessions();
    if (sessionsData != null) {
      sessions.assignAll(sessionsData.cast<String>());
    } else {
      Get.snackbar("Ошибка", "Не получилось получить сессии",
          backgroundColor: Colors.red);
    }
  }

  Future<void> getSessionById(String sessionId) async {
    var data = await networkServices.getSessionById(sessionId);
    if (data != null) {
      currentSession = data;
    } else {
      Get.snackbar(
          "Ошибка", "Не получилось получить данные о конкретной сессии",
          backgroundColor: Colors.red);
    }
  }

  Future<void> joinSession(String sessionId) async {
    if (await networkServices.joinSession(sessionId)) {
      Get.offAndToNamed(Routes.GAME);
    } else {
      Get.snackbar("Ошибка", "Не удалось подключиться",
          backgroundColor: Colors.red);
    }
  }

  Future<void> logout() async {
    await storageService.delete("user");
    await storageService.delete("baseAuth");
    Get.offAllNamed(Routes.LOGIN);
  }

  Future<void> changeNickname(newNickname) async{
    if (await networkServices.changeNickname(newNickname))
    {
        updateLocalData();
        return Get.back();
    }
    else {Get.snackbar("Ошибка", "Не удалось сменить никнейм",
          backgroundColor: Colors.red);}
  }

  // DELETE /session/leave
  Future<void> leaveSession() async {}

  // PATCH /user/update сменить никнейм кнопочка
}
