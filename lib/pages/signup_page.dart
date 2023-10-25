// ignore_for_file: use_build_context_synchronously

import 'package:cyber_vault/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:cyber_vault/models/signup.dart';
import 'package:http/http.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String responseTitle = "";
  String responseText = "";
  String responseStatusCode = "";

  Future<Response> _signUp() async {
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String email = emailController.text;
    String phone = phoneController.text;
    String username = usernameController.text;
    String password = passwordController.text;

    var response =
        await signUp(firstName, lastName, email, phone, username, password);

    return response;
  }

  int _currentStep = 0;
  String? _firstNameErrorText;
  String? _lastNameErrorText;
  String? _emailErrorText;
  String? _phoneErrorText;
  String? _usernameErrorText;
  String? _passwordErrorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () async {
          if (_currentStep == 0) {
            if (firstNameController.text.isEmpty) {
              setState(() {
                _firstNameErrorText = "First Name Field can't be empty!";
              });
              Future.delayed(const Duration(seconds: 5), () {
                setState(() {
                  _firstNameErrorText = null;
                });
              });
            }

            if (lastNameController.text.isEmpty) {
              setState(() {
                _lastNameErrorText = "Last Name Field can't be empty!";
              });
              Future.delayed(const Duration(seconds: 5), () {
                setState(() {
                  _lastNameErrorText = null;
                });
              });
              return;
            }

            if (firstNameController.text.isNotEmpty &&
                lastNameController.text.isNotEmpty) {
              setState(() {
                _currentStep += 1;
              });
            }
          } else if (_currentStep == 1) {
            if (emailController.text.isEmpty) {
              setState(() {
                _emailErrorText = "Email Field can't be empty!";
              });
              Future.delayed(const Duration(seconds: 5), () {
                setState(() {
                  _emailErrorText = null;
                });
              });
            }

            if (phoneController.text.isEmpty) {
              setState(() {
                _phoneErrorText = "Phone Field can't be empty!";
              });
              Future.delayed(const Duration(seconds: 5), () {
                setState(() {
                  _phoneErrorText = null;
                });
              });
              return;
            }

            if (emailController.text.isNotEmpty &&
                phoneController.text.isNotEmpty) {
              setState(() {
                _currentStep += 1;
              });
            }
          } else if (_currentStep == 2) {
            if (usernameController.text.isEmpty) {
              setState(() {
                _usernameErrorText = "Username Field can't be empty!";
              });
              Future.delayed(const Duration(seconds: 5), () {
                setState(() {
                  _usernameErrorText = null;
                });
              });
            }

            if (usernameController.text.isNotEmpty) {
              setState(() {
                _currentStep += 1;
              });
            }
          } else if (_currentStep == 3) {
            if (passwordController.text.isEmpty) {
              setState(() {
                _passwordErrorText = "Password Field can't be empty!";
              });
              Future.delayed(const Duration(seconds: 5), () {
                setState(() {
                  _passwordErrorText = null;
                });
              });
            }

            if (passwordController.text.isNotEmpty) {
              // ignore: await_only_futures
              var response = await _signUp();
              if (response.statusCode == 200) {
                setState(() {
                  responseTitle = "Success";
                  responseText = "Account created successfully!";
                  responseStatusCode = response.statusCode.toString();
                });
              } else {
                setState(() {
                  responseTitle = "Error";
                  responseText = response.body.toString();
                  responseStatusCode = response.statusCode.toString();
                });
              }
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(responseTitle),
                    content: Text(responseText),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );

              if (responseStatusCode == "200") {
                // Navigator.pop(context);
                Navigator.pushNamed(context, '/login');
              }
            }
          }
        },
        onStepCancel: () {
          _currentStep > 0
              ? setState(() {
                  _currentStep -= 1;
                })
              : null;
        },
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Padding(
              padding: const EdgeInsets.fromLTRB(10, 12, 0, 0),
              child: Center(
                  child: Row(
                children: <Widget>[
                  if (_currentStep < 3)
                    FilledButton(
                      onPressed: details.onStepContinue,
                      child: const Text('Next'),
                    ),
                  if (_currentStep == 3)
                    FilledButton(
                      onPressed: details.onStepContinue,
                      child: const Text('Create Account'),
                    ),
                  if (_currentStep > 0)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                      child: SizedBox(
                        width: 70,
                        height: 35,
                        child: TextButton(
                          onPressed: details.onStepCancel,
                          child: const Text('Back'),
                        ),
                      ),
                    ),
                ],
              )));
        },
        steps: [
          Step(
            title: const Text('Name'),
            content: Column(
              children: <Widget>[
                MaterialTextField(
                  controller: firstNameController,
                  isPassword: false,
                  labelText: "First Name",
                  marginTop: 5,
                  marginLeft: 5,
                  marginRight: 5,
                  marginBottom: 15,
                  errorText: _firstNameErrorText,
                ),
                MaterialTextField(
                  controller: lastNameController,
                  isPassword: false,
                  labelText: "Last Name",
                  marginTop: 5,
                  marginLeft: 5,
                  marginRight: 5,
                  marginBottom: 5,
                  errorText: _lastNameErrorText,
                ),
              ],
            ),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: const Text('Contact'),
            content: Column(
              children: <Widget>[
                MaterialTextField(
                  controller: emailController,
                  isPassword: false,
                  labelText: "Email",
                  marginTop: 5,
                  marginLeft: 5,
                  marginRight: 5,
                  marginBottom: 15,
                  errorText: _emailErrorText,
                ),
                MaterialTextField(
                  controller: phoneController,
                  isPassword: false,
                  labelText: "Phone",
                  marginTop: 5,
                  marginLeft: 5,
                  marginRight: 5,
                  marginBottom: 5,
                  errorText: _phoneErrorText,
                ),
              ],
            ),
            isActive: _currentStep >= 1,
          ),
          Step(
            title: const Text('Username'),
            content: Column(
              children: <Widget>[
                MaterialTextField(
                  isPassword: false,
                  controller: usernameController,
                  labelText: "Username",
                  marginTop: 5,
                  marginLeft: 5,
                  marginRight: 5,
                  marginBottom: 5,
                  errorText: _usernameErrorText,
                )
              ],
            ),
            isActive: _currentStep >= 2,
          ),
          Step(
            title: const Text('Password'),
            content: Column(
              children: <Widget>[
                MaterialTextField(
                    isPassword: true,
                    controller: passwordController,
                    labelText: "Password",
                    marginTop: 5,
                    marginLeft: 5,
                    marginRight: 5,
                    marginBottom: 5,
                    errorText: _passwordErrorText),
              ],
            ),
            isActive: _currentStep >= 3,
          ),
        ],
      ),
    );
  }
}
