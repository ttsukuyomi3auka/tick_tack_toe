import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tick_tack_toe/app/routes/app_pages.dart';
import 'package:tick_tack_toe/core/constants.dart';
import 'package:tick_tack_toe/models/session.dart';
import 'package:tick_tack_toe/models/user.dart';
import 'package:tick_tack_toe/services/network_services.dart';
import 'package:tick_tack_toe/services/storage_service.dart';

class GameController extends GetxController {
  final StorageService storageService = Get.find<StorageService>();
  final NetworkServices networkServices = Get.find<NetworkServices>();
  Rx<SessionResponse> currentSession = SessionResponse().obs;
  Rx<UserResponse> currentUser = UserResponse(user: User()).obs;
  RxMap<String, dynamic> board = <String, dynamic>{}.obs;
  RxString currentPlayerSymbol = 'X'.obs;

  @override
  void onInit() async {
    await updateLocalData();
    initBoard();
    print(currentSession.value);
    super.onInit();
  }

  void initBoard() {
    board.value = currentSession.value.board!;
  }

  Future<void> updateFields(int row, int col) async {
    isEnd();
    if (board.isEmpty || board['row$row'][col] == 'E') {
      await move(row, col);
      isEnd();
      board['row$row'][col] = currentPlayerSymbol.value;
      drawXO(row, col);
      changePlayerMove();
    }
  }

  void isEnd() {
    if (currentSession.value.gameState == GameState.Ongoing) {
      return;
    } else if (currentSession.value.gameState == GameState.XWon) {
      Get.snackbar("Игра окончена", "Игрок X победил!",
          backgroundColor: Colors.green);
    } else if (currentSession.value.gameState == GameState.OWon) {
      Get.snackbar("Игра окончена", "Игрок O победил!",
          backgroundColor: Colors.green);
    } else if (currentSession.value.gameState == GameState.Draw) {
      Get.snackbar("Игра окончена", "Ничья!", backgroundColor: Colors.yellow);
    }
  }

  void changePlayerMove() {
    currentPlayerSymbol.value = (currentPlayerSymbol.value == 'X') ? 'O' : 'X';
  }

  void drawXO(int row, int col) {
    String xoSymbol = currentPlayerSymbol.value;
    board['row$row'][col] = xoSymbol;
  }

  Future<void> move(int row, int col) async {
    if (await networkServices.move(row, col)) {
      updateLocalData();
      initBoard();
    }
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
      Get.snackbar("Ошибка", "Не удалось выйти", backgroundColor: Colors.red);
    }
  }
}
