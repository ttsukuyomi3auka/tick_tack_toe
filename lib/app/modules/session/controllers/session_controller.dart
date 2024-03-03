import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tick_tack_toe/app/routes/app_pages.dart';
import 'package:tick_tack_toe/models/session.dart';
import 'package:tick_tack_toe/models/short_session.dart';
import 'package:tick_tack_toe/models/user.dart';
import 'package:tick_tack_toe/services/network_services.dart';
import 'package:tick_tack_toe/services/storage_service.dart';

class SessionController extends GetxController {
  StorageService storageService = StorageService();
  NetworkServices networkServices = NetworkServices();
  Rx<SessionResponse> currentSession = SessionResponse().obs;
  RxList<ShortSession> shortSession = <ShortSession>[].obs;
  final newUserNicknameController = TextEditingController();
  final sessionnameController = TextEditingController();
  Rx<UserResponse> currentUser = UserResponse(user: User()).obs;

  @override
  void onInit(){
    updateLocalData();
    getSessions();
    super.onInit();
  }

  Future<void> updateLocalData() async {
    currentUser.value = await storageService.readUserResponse('user');
    currentSession.value = await storageService.readSessionResponse('session');
    await getSessions();
  }

  Future<void> createSession(String sessionName) async {
    if (await networkServices.createSession(sessionName)) {
      updateLocalData();
      Get.back();
    } else {
      Get.snackbar("Ошибка", "Не удалось создать сессию",
          backgroundColor: Colors.red);
    }
  }

  Future<void> startSession(String sessionId) async {
    if (await networkServices.startSession(sessionId)) {
      updateLocalData();
      Get.offAndToNamed(Routes.GAME);
    } else {
      Get.snackbar("Ошибка", "Не удалось запустить игру",
          backgroundColor: Colors.red);
    }
  }

  Future<void> getSessions() async {
    shortSession.assignAll(await networkServices.getSessions() ?? []);
    if (shortSession.isEmpty) {
      Get.snackbar("Ошибка", "Не получилось получить сессии",
          backgroundColor: Colors.red);
    }
  }

  Future<void> getSessionById(String sessionId) async {
    var data = await networkServices.getSessionById(sessionId);
    if (data != null) {
      currentSession.value = data;
    } else {
      Get.snackbar(
          "Ошибка", "Не получилось получить данные о конкретной сессии",
          backgroundColor: Colors.red);
    }
  }

  Future<void> joinSession(String sessionId) async {
    if (await networkServices.joinSession(sessionId)) {
      updateLocalData();
      Get.offAndToNamed(Routes.GAME);
    } else {
      Get.snackbar("Ошибка", "Не удалось подключиться",
          backgroundColor: Colors.red);
    }
  }

  Future<void> logout() async {
    if (await networkServices.deleteUser()) {
      await storageService.delete("user");
      await storageService.delete("baseAuth");
      Get.offAllNamed(Routes.LOGIN);
    } else {
      Get.snackbar("Ошибка", "Не удается сменить пользователя",
          backgroundColor: Colors.red);
    }
  }

  Future<void> changeNickname(newNickname) async {
    if (await networkServices.changeNickname(newNickname)) {
      updateLocalData();
      return Get.back();
    } else {
      Get.snackbar("Ошибка", "Не удалось сменить никнейм",
          backgroundColor: Colors.red);
    }
  }
}
