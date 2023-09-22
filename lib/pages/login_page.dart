import 'package:cyber_vault/pages/shell_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cyber_vault/pages/signup_page.dart';
import 'package:cyber_vault/widgets/text_field.dart';

import '../backend/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final bool _isSigning = false;

  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text("Cyber Vault",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ))),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              MaterialTextField(
                isPassword: false,
                controller: _emailController,
                labelText: 'Email',
                marginTop: 15,
                marginBottom: 10,
                width: 400,
              ),
              MaterialTextField(
                isPassword: true,
                controller: _passwordController,
                labelText: 'Password',
                marginTop: 10,
                marginBottom: 20,
                width: 400,
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: FilledButton(
                    onPressed: _signIn, child: const Text("Login")),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()),
                            (route) => false);
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      if (kDebugMode) {
        print("User is successfully signedIn");
      }
      // Navigator.pushNamed(context, "/home");
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const ShellPage()),
          (route) => false);
    } else {
      if (kDebugMode) {
        print("Some error happend");
      }
    }
  }
}
