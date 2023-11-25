// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, avoid_print

import 'package:cyber_vault/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:cyber_vault/services/account_service.dart';

class AddAccountPage extends StatefulWidget {
  const AddAccountPage({Key? key}) : super(key: key);

  @override
  _AddAccountPageState createState() => _AddAccountPageState();
}

class _AddAccountPageState extends State<AddAccountPage> {
  // controller
  final TextEditingController domainController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  _addAccount() async {
    String domain = domainController.text;
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String email = emailController.text;
    String username = usernameController.text;
    String password = passwordController.text;
    String phoneNumber = phoneNumberController.text;

    var response = await addAccount(
        domain, firstName, lastName, email, username, password, phoneNumber);

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Account"),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            MaterialTextField(
              isPassword: false,
              controller: domainController,
              labelText: "Domain",
              marginTop: 15,
              marginLeft: 25,
              marginRight: 25,
              marginBottom: 25,
              width: 500,
            ),
            MaterialTextField(
              isPassword: false,
              controller: firstNameController,
              labelText: "First Name",
              marginLeft: 25,
              marginRight: 25,
              marginBottom: 25,
              width: 500,
            ),
            MaterialTextField(
              isPassword: false,
              controller: lastNameController,
              labelText: "Last Name",
              marginLeft: 25,
              marginRight: 25,
              marginBottom: 25,
              width: 500,
            ),
            MaterialTextField(
              isPassword: false,
              controller: emailController,
              labelText: "Email",
              marginLeft: 25,
              marginRight: 25,
              marginBottom: 25,
              width: 500,
            ),
            MaterialTextField(
              isPassword: false,
              controller: usernameController,
              labelText: "Username",
              marginLeft: 25,
              marginRight: 25,
              marginBottom: 25,
              width: 500,
            ),
            MaterialTextField(
              isPassword: true,
              controller: passwordController,
              labelText: "Password",
              marginLeft: 25,
              marginRight: 25,
              width: 500,
            ),
            MaterialTextField(
              isPassword: false,
              controller: phoneNumberController,
              labelText: "Phone Number",
              marginTop: 25,
              marginLeft: 25,
              marginRight: 25,
              marginBottom: 25,
              width: 500,
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                child: FilledButton(
                    onPressed: () async {
                      dynamic response = await _addAccount();
                      print(response.body);
                      if (response.body.toString() ==
                          'Password added successfully') {
                        Navigator.pop(context);
                      } else {}
                    },
                    child: const Text("Add Account")))
          ],
        )),
      ),
    );
  }

  @override
  void dispose() {
    emailController
        .dispose(); // Dispose of the controller to prevent memory leaks
    super.dispose();
  }
}
