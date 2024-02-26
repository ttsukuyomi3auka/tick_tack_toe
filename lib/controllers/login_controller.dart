import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  final TextEditingController usernameController = TextEditingController();

  Future<void> login() async {
    
    var httpClient = Dio();
    String username = usernameController.text;

    try {
      var response = await httpClient.post('https://ttt.bulbaman.me/user/add/:$username');
      if (response.statusCode == 200) { }

    } catch (error) {
      print('Ошибка входа: $error');
    }
  }
}
