import 'package:assessment_tracker/controllers/auth_controller.dart';
import 'package:assessment_tracker/resources/components.dart';
import 'package:assessment_tracker/resources/style.dart';
import 'package:assessment_tracker/resources/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("SIGN UP", style: heading)),
        body: Column(
          children: [
            gap20,
            Image.asset('assets/report.png', height: 200),
            const RegisterForm(),
          ],
        ));
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  //auth controller
  final AuthController authController = Get.put(AuthController());
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
                decoration: inputFieldDecoration.copyWith(hintText: 'Password'),
                validator: (value) =>
                    value!.length > 6 ? 'Password must be 6 characters' : null,
              ),
              gap20,
              ElevatedButton(
                  style: buttonStyle,
                  onPressed: () {
                    authController.register(
                        _emailController.text, _passwordController.text);
                  },
                  child: const Text("Sign Up", style: buttonText)),
              gap20,
              TextButton(
                  onPressed: () {
                    Get.toNamed('/login');
                  },
                  child: const Text("Already Have an account? Sign in"))
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
