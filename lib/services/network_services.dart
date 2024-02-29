import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tick_tack_toe/core/constants.dart';
import 'package:tick_tack_toe/models/session.dart';
import 'package:tick_tack_toe/models/user.dart';
import 'package:tick_tack_toe/services/auth.dart';
import 'package:tick_tack_toe/services/storage_service.dart';

class NetworkServices extends GetxController {
  var httpClient = Dio();
  var storageService = StorageService();

  Future<bool> addUser(String nickname) async {
    try {
      var response = await httpClient.post('$baseUrl/user/add/$nickname');
      if (response.statusCode == 200) {
        var currentUser = UserResponse.fromJson(response.data);
        await storageService.writeUserResponse("user", currentUser);
        getBaseAuth(currentUser);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<dynamic>?> getSessions() async {
    try {
      var response = await httpClient.get('$baseUrl/session/get');
      if (response.statusCode == 200) {
        List<dynamic> sessionsData = response.data;
        return sessionsData;
      } else {
        return null;
      }
    } catch (e) {
      print("Ошибка: $e");
      return null;
    }
  }

  Future<SessionResponse?> getSessionById(sessionId) async {
    try {
      var response = await httpClient.get('$baseUrl/session/get/$sessionId');
      if (response.statusCode == 200) {
        var currentSession = SessionResponse.fromJson(response.data);
        await storageService.writeSessionResponse("session", currentSession);
        return currentSession;
      } else {
        print(response.statusCode);
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  //переписать baseAuth так как сделано в функции ниже
  Future<bool> joinSession(String sessionId) async {
    String? baseAuth = await storageService.read('baseAuth');
    if (baseAuth != null) {
      var response = await httpClient.post('$baseUrl/session/join/$sessionId',
          options: Options(headers: <String, String>{
            'authorization': baseAuth,
          }));
      if (response.statusCode == 200) {
        //нужно внести измениния в сессию
        return true;
      } else {
        print("Не удалось подключиться");
        return false;
      }
    } else {
      print('Ошибка: baseAuth равен null');
      return false;
    }
  }

  Future<bool> changeNickname(String newNickname) async {
    try {
      var response = await httpClient.patch('$baseUrl/user/update',
          data: {"username": newNickname},
          options: Options(headers: <String, String>{
            'authorization': await storageService.read('baseAuth') ?? '',
          }));
      if (response.statusCode == 200) {
        var data = await storageService.readUserResponse('user');
        var updateUserResponse = UserResponse(
            private_key: data.private_key, user: User.fromJson(response.data));
        await storageService.writeUserResponse("user", updateUserResponse);
        return true;
      } else {
        print(response.statusCode);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
   
}
