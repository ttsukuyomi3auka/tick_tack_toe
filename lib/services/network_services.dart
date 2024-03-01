import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tick_tack_toe/core/constants.dart';
import 'package:tick_tack_toe/models/session.dart';
import 'package:tick_tack_toe/models/short_session.dart';
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

  Future<bool> deleteUser() async {
    try {
      var response = await httpClient.delete('$baseUrl/user/delete',
          data: await storageService.readUserResponse('user'),
          options: Options(headers: <String, String>{
            'authorization': await storageService.read('baseAuth') ?? '',
          }));
      if (response.statusCode == 200) {
        return true;
      } else {
        print(response.statusCode);
        return true;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> createSession(String sessionName) async {
    try {
      print(await storageService.read('baseAuth'));
      print(sessionName);
      print('$baseUrl/session/create/$sessionName');
      var response =
          await httpClient.post('$baseUrl/session/create/$sessionName',
              options: Options(headers: <String, String>{
                'authorization': await storageService.read('baseAuth') ?? '',
              }));
      if (response.statusCode == 200) {
        await storageService.writeSessionResponse(
            "session", SessionResponse.fromJson(response.data));
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<ShortSession>?> getSessions() async {
    try {
      var response = await httpClient.get('$baseUrl/session/get_all');
      if (response.statusCode == 200) {
        List<Map<String, dynamic>> sessionsData = List.castFrom(response.data);
        List<ShortSession> sessionsList =
            sessionsData.map((data) => ShortSession.fromJson(data)).toList();

        return sessionsList;
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
    var response = await httpClient.post('$baseUrl/session/join/$sessionId',
        options: Options(headers: <String, String>{
          'authorization': await storageService.read('baseAuth') ?? '',
        }));
    if (response.statusCode == 200) {
      //нужно внести измениния в сессию
      return true;
    } else {
      print("Не удалось подключиться");
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
