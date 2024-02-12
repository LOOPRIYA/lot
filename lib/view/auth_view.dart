import 'package:flutter/material.dart';
import 'package:lot/model/reg_model.dart';

import '../controller/reg_controller.dart';

final nameController = TextEditingController();
final phoneController = TextEditingController();
final passwordController = TextEditingController();

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffFEFFF4),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                  )),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                  )),
                  label: Text("Имя")),
              controller: nameController,
            ),
            SizedBox(
              height: 24,
            ),
            TextField(
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                  )),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                  )),
                  label: Text("Пароль")),
              controller: passwordController,
            ),
            SizedBox(
              height: 24,
            ),
            TextField(
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                  )),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                  )),
                  label: Text("Номер телефона")),
              controller: phoneController,
            ),
            ElevatedButton(onPressed: () {
              AuthController().registrationUser(nameController.text, phoneController.text, passwordController.text);
            }, child: Text("Войти"))
          ],
        ),
      ),
    );
  }
}
