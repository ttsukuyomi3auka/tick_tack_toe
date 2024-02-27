import 'package:get/get.dart';
import 'package:tick_tack_toe/models/session.dart';

class SessionController extends GetxController {
  //TODO: Implement SessionController

  @override
  void onInit() {
    super.onInit();
  }

  // POST /session/create/:НазваниеСессии
  Future<void> createSession(String sessionName) async {}

  // PATCH /session/start
  Future<void> startSession() async {}
  
  // GET /session/get
  Future<List<String>> getSessionList() async {
    return [""];
  }

  // GET /session/get/:ИДСессии
  // Future<SessionResponse> getSessionById(String sessionId) async {
  //   return;
  // }


  // PATCH /session/join/:ИДСессии
  Future<void> joinSession(String sessionId) async {}

  // DELETE /session/leave
  Future<void> leaveSession() async {}
}
