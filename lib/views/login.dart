import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tick_tack_toe/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  LoginController loginController = Get.put(LoginController());
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: loginController.usernameController,
              decoration: InputDecoration(labelText: 'Никнейм'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){}, child: Text('Войти')),
          ],
        ),
      ),
    );
  }
}
