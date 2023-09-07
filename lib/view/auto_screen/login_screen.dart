import 'package:flutter/material.dart';
import 'package:mc_dragon/common_widget/round_button.dart';
import 'package:mc_dragon/common_widget/round_phone.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/mc.png',
                width: 100,
                height: 100,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Sign In To Continue",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black26,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              RoundPhone(),
              const SizedBox(height: 30),
              RoundButton(title: "Login", onPress: () {})
            ],
          ),
        ),
      ),
    );
  }
}
