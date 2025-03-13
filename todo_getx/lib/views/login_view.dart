import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/auth_controller.dart';
import 'package:todo_getx/views/register_view.dart';
import 'package:todo_getx/widgets/app_text_field.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  AuthController authController = Get.put(AuthController());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: const Color.fromARGB(255, 31, 120, 228),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            AppTextField(label: 'Email', controller: emailController),
            AppTextField(
              label: 'Password',
              controller: passwordController,
              hideText: true,
            ),
            ElevatedButton(
              onPressed: () {
                authController.login(
                  emailController.text,
                  passwordController.text,
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.off(RegisterView());
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
