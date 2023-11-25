// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:cyber_vault/models/user.dart';
import 'package:cyber_vault/services/local_session.dart';
import 'package:cyber_vault/pages/shell_page.dart';
import 'package:flutter/material.dart';
import 'package:cyber_vault/widgets/text_field.dart';
import 'package:cyber_vault/services/login.dart';
import 'package:sqflite/sqflite.dart';

Future<void> insertUser(User user) async {
  final db = await getDatabase();
  await db.insert(
    'users',
    user.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    var response = await login(email, password);
    print(response.statusCode);

    if (response.statusCode == 200) {
      print(response.body);
      final Map<String, dynamic> responseData = json.decode(response.body);
      final User user = User(
        firstName: responseData['firstName'],
        lastName: responseData['lastName'],
        email: responseData['email'],
        username: responseData['username'],
        token: responseData['token'],
      );

      // Insert user into the database
      await insertUser(user);

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const ShellPage()),
          (route) => false);
    } else {
      setState(() {
        // responseText = "Error: ${response.statusCode}";
      });
    }
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
                    onPressed: () {
                      _signIn();
                    },
                    child: const Text("Login")),
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
                        Navigator.pushNamed(context, '/signUp');
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
}
