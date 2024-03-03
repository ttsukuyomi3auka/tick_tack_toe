import 'package:get/get.dart';
import 'package:tick_tack_toe/models/session.dart';
import 'package:tick_tack_toe/services/network_services.dart';
import 'package:tick_tack_toe/services/storage_service.dart';

class GameController extends GetxController {
  StorageService get storageService => Get.find<StorageService>();
  NetworkServices get networkServices => Get.find<NetworkServices>();
  Rx<SessionResponse> currentSession = SessionResponse().obs;

  @override
  void onInit() {
    updateLocalData();
    super.onInit();
  }

  Future<void> updateLocalData() async {
    currentSession.value = await storageService.readSessionResponse('session');
  }
}
