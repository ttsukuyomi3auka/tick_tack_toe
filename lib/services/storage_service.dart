import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:tick_tack_toe/models/user.dart';

class StorageService extends GetxService {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<String?> read(String key) async {
    return await storage.read(key: key);
  }

  Future<void> write(String key, UserResponse user) async {
    await storage.write(key: key, value: jsonEncode(user.toJson()));
  }

  Future<void> writeBaseAuth(String key, String baseAuth) async {
    await storage.write(key: key, value: baseAuth);
  }
}
