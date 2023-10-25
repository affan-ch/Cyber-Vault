// ignore_for_file: library_private_types_in_public_api

import 'package:cyber_vault/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:cyber_vault/models/add_password.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddPasswordPage extends StatefulWidget {
  const AddPasswordPage({Key? key}) : super(key: key);

  @override
  _AddPasswordPageState createState() => _AddPasswordPageState();
}

class _AddPasswordPageState extends State<AddPasswordPage> {
  // controller
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  _addPassword() async {
    String name = nameController.text;
    String email = emailController.text;
    String username = usernameController.text;
    String password = passwordController.text;
    String title = titleController.text;

    var response = await addPassword(name, email, username, password, title);

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null,
      ),
      body: Center(
          child: Column(
        children: [
          MaterialTextField(
            isPassword: false,
            controller: nameController,
            labelText: "Name",
            marginTop: 15,
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
            controller: titleController,
            labelText: "Title",
            marginTop: 25,
            marginLeft: 25,
            marginRight: 25,
            marginBottom: 25,
            width: 500,
          ),
          FilledButton(
              onPressed: () async {
                dynamic response = await _addPassword();

                if (response.body.toString() == 'Password added successfully') {
                  Navigator.pop(context);
                  // Fluttertoast.showToast(
                  //     msg: "Password added successfully",
                  //     toastLength: Toast.LENGTH_SHORT,
                  //     gravity: ToastGravity.BOTTOM,
                  //     timeInSecForIosWeb: 1,
                  //     backgroundColor: Theme.of(context).colorScheme.secondary,
                  //     textColor: Colors.white,
                  //     fontSize: 16.0);
                } else {
                  // show toast
                  Fluttertoast.showToast(
                      msg: "Password not added successfully",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              },
              child: const Text("Add Password"))
        ],
      )),
    );
  }

  @override
  void dispose() {
    emailController
        .dispose(); // Dispose of the controller to prevent memory leaks
    super.dispose();
  }
}
