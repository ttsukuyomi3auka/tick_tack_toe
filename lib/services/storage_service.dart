import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:tick_tack_toe/models/user.dart';

class StorageService extends GetxService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> write(UserResponce user) async {
    await _storage.write(key: user.user.username, value: user.private_key);
  }
}
