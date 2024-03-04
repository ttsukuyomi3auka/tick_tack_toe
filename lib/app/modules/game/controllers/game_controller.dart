import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tick_tack_toe/app/routes/app_pages.dart';
import 'package:tick_tack_toe/core/constants.dart';
import 'package:tick_tack_toe/models/session.dart';
import 'package:tick_tack_toe/models/user.dart';
import 'package:tick_tack_toe/services/network_services.dart';
import 'package:tick_tack_toe/services/storage_service.dart';

class GameController extends GetxController {
  StorageService get storageService => Get.find<StorageService>();
  NetworkServices get networkServices => Get.find<NetworkServices>();
  Rx<SessionResponse> currentSession = SessionResponse().obs;
  Rx<UserResponse> currentUser = UserResponse(user: User()).obs;

  @override
  void onInit() async {
    updateLocalData();
    print(currentSession.value);
    super.onInit();
  }

  Future<void> updateLocalData() async {
    currentSession.value = await storageService.readSessionResponse('session');
    currentUser.value = await storageService.readUserResponse('user');
  }

  Future<void> leaveSession(int who) async {
    if (await networkServices.leaveSession(who)) {
      updateLocalData();
      Get.offAndToNamed(Routes.SESSION);
    } else {
      Get.snackbar("Ошибка", "Не удалось сменить никнейм",
          backgroundColor: Colors.red);
    }
  }
  void onCellTapped(int index) {
    // Проверяем, что игра не завершена и ячейка пуста
    if (currentSession.value.gameState == GameState.Ongoing &&
        getCellValue(index) == "") {
      // Отправляем запрос на сервер о сделанном ходе
    }
  }

  // Метод для получения значения для отображения в ячейке
  String getCellValue(int index) {
    // Получаем значение из текущего состояния игры
    return currentSession.value.board?[index] ?? "";
  }

}
