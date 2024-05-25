import 'package:assessment_tracker/controllers/auth_controller.dart';
import 'package:assessment_tracker/resources/components.dart';
import 'package:assessment_tracker/resources/style.dart';
import 'package:assessment_tracker/resources/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SIGN IN", style: heading)),
      body: Column(
        children: [
          gap20,
          Image.asset('assets/report.png', height: 200),
          const LoginForm(),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  //auth controllers
  final AuthController _authController = Get.put(AuthController());
  //text editors
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                  controller: _emailController,
                  decoration: inputFieldDecoration),
              gap10,
              TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration:
                      inputFieldDecoration.copyWith(hintText: 'Password')),
              gap20,
              ElevatedButton(
                  style: buttonStyle,
                  onPressed: () {
                    _authController.login(
                        _emailController.text, _passwordController.text);
                  },
                  child: const Text("Sign In", style: buttonText)),
              gap20,
              TextButton(
                  onPressed: () {
                    Get.toNamed('/register');
                  },
                  child: const Text("Haven't an account? Sign Up"))
            ],
          )),
    );
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
