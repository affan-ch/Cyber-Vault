import 'package:cyber_vault/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:cyber_vault/pages/login_page.dart';
import 'package:cyber_vault/models/signup.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String responseText = ".";

  void _signUp() async {
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    var response = await signUp(name, email, password);

    if (response.statusCode == 200) {
      setState(() {
        responseText = "Account created successfully!";
      });
    } else {
      setState(() {
        responseText = "Error: ${response.statusCode}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text("SignUp"),
        title: null,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign Up",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              MaterialTextField(
                isPassword: false,
                controller: _nameController,
                labelText: 'Name',
                marginTop: 30,
                marginBottom: 10,
                width: 400,
              ),
              MaterialTextField(
                isPassword: false,
                controller: _emailController,
                labelText: 'Email',
                marginTop: 10,
                marginBottom: 10,
                width: 400,
              ),
              MaterialTextField(
                isPassword: true,
                controller: _passwordController,
                labelText: 'Password',
                marginTop: 10,
                marginBottom: 25,
                width: 400,
              ),
              Text(
                responseText,
                style: const TextStyle(fontSize: 18),
              ),
              SizedBox(
                width: 400,
                height: 45,
                child: FilledButton(
                  onPressed: () {
                    // _signUp();
                    _signUp();
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                            (route) => false);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
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
