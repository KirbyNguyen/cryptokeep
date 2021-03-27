import 'package:cryptokeep/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  final controller = Get.put(SplashController());

  void loginWithFingerprint(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/Logo.png",
                height: 100,
                width: 100,
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  LoginForm(),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () => controller.loginWithFP(),
                    child: Icon(
                      Icons.fingerprint_rounded,
                      size: 40,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: controller.key,
        child: TextFormField(
          controller: controller.masterPasswordController,
          autocorrect: false,
          obscureText: true,
          enableSuggestions: false,
          style: TextStyle(color: Colors.white),
          validator: (v) => controller.passwordValidator(v),
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () => controller.loginWithPassword(context),
              child: Icon(
                Icons.lock_open_outlined,
                color: Colors.white70,
              ),
            ),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
            hintText: "Enter master password",
            hintStyle: TextStyle(color: Colors.grey),
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
