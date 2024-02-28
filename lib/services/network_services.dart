import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tick_tack_toe/core/constants.dart';
import 'package:tick_tack_toe/models/user.dart';
import 'package:tick_tack_toe/services/storage_service.dart';

class NetworkServices extends GetxController {
  var httpClient = Dio();
  var storageService = StorageService();

  Future<void> addUser(String nickname) async {
    try {
      var response = await httpClient.post('$baseUrl/user/add/$nickname');
      if (response.statusCode == 200) {
        var currentUser = UserResponse.fromJson(response.data);
        await storageService.write("user", currentUser);

      }
    } catch (e) {
      print(e);
    }
  }
}
