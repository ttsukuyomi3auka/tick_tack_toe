import 'dart:convert';
import 'dart:html';

import 'package:tick_tack_toe/models/user.dart';
import 'package:tick_tack_toe/services/storage_service.dart';

StorageService storageService = StorageService();

void getBaseAuth(UserResponse user) {
  String baseAuth =
      'Basic ${base64.encode(utf8.encode('${user.user.username}:${user.private_key}'))}';
  storageService.writeBaseAuth("baseAuth", baseAuth);
}
