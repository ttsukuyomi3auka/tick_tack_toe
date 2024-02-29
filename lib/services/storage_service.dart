import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:tick_tack_toe/models/session.dart';
import 'package:tick_tack_toe/models/user.dart';

class StorageService extends GetxService {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<String?> read(String key) async {
    return await storage.read(key: key);
  }

  Future<UserResponse> readUserResponse(String key) async {
    String? data = await storage.read(key: key);
    if (data != null) {
      return UserResponse.fromJson(jsonDecode(data));
    } else {
      return UserResponse(user: User());
    }
  }

  Future<void> writeUserResponse(String key, UserResponse user) async {
    await storage.write(key: key, value: jsonEncode(user.toJson()));
  }

  Future<void> writeSessionResponse(String key, SessionResponse session) async {
    await storage.write(key: key, value: jsonEncode(session.toJson()));
  }

  Future<SessionResponse> readSessionResponse(String key) async {
    String? data = await storage.read(key: key);
    if (data!=null){
      return SessionResponse.fromJson(jsonDecode(data));
    }
    else {
      return SessionResponse();
    }
  }

  Future<void> writeBaseAuth(String key, String baseAuth) async {
    await storage.write(key: key, value: baseAuth);
  }

  Future<void> delete(String key) async {
    await storage.delete(key: key);
  }
}
