import 'package:flutter/material.dart';
import 'package:mc_dragon/common_widget/round_button.dart';
import 'package:mc_dragon/view/auto_screen/login_screen.dart';
import 'package:mc_dragon/view/auto_screen/sign_up_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/image/mc.png',
                  width: 150,
                  height: 150,
                ),
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              const Text(
                "Welcome",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Radio(
                          value: 1,
                          activeColor: Colors.red,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value!;
                            });
                          }),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "English",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Radio(
                          value: 2,
                          activeColor: Colors.red,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value!;
                            });
                          }),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "Khmer",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Radio(
                          value: 3,
                          activeColor: Colors.red,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value!;
                            });
                          }),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "chinese",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                child: RoundButton(
                    title: "Login",
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    }),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                child: RoundButton(
                    title: "Sign up",
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                    }),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                child: RoundButton(title: "test", onPress: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
