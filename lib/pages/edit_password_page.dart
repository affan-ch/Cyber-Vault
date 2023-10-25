// ignore_for_file: library_private_types_in_public_api

import 'package:cyber_vault/widgets/text_field.dart';
import 'package:flutter/material.dart';

class EditPasswordPage extends StatefulWidget {
  final dynamic user;

  const EditPasswordPage({super.key, required this.user});

  @override
  _EditPasswordPageState createState() => _EditPasswordPageState();
}

class _EditPasswordPageState extends State<EditPasswordPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  bool isReadOnly = true;

  void toggleReadOnly() {
    setState(() {
      isReadOnly = !isReadOnly;
    });
  }

  @override
  void initState() {
    super.initState();
    nameController.text = widget.user.name;
    emailController.text = widget.user.email;
    usernameController.text = widget.user.username;
    passwordController.text = widget.user.password;
    titleController.text = widget.user.title;
  }

  // void deletePassword() async {
  //   String name = nameController.text;
  //   String email = emailController.text;
  //   String username = usernameController.text;
  //   String password = passwordController.text;
  //   String title = titleController.text;

  //   var response = await deletePassword(name, email, username, password, title);

  //   return response;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Password'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                child: FilledButton.icon(
                  onPressed: () {
                    toggleReadOnly();
                  },
                  label: const Text("Edit"),
                  icon: const Icon(Icons.edit),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                  child: FilledButton.icon(
                      onPressed: () {
                        toggleReadOnly();
                      },
                      icon: const Icon(Icons.delete),
                      label: const Text("Delete"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).colorScheme.onSecondary),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).colorScheme.secondary),
                      ))),
            ]),
            MaterialTextField(
              isPassword: false,
              controller: nameController,
              labelText: "Name",
              marginTop: 15,
              marginLeft: 25,
              marginRight: 25,
              marginBottom: 25,
              width: 500,
              isReadOnly: isReadOnly,
            ),
            MaterialTextField(
              isPassword: false,
              controller: emailController,
              labelText: "Email",
              marginLeft: 25,
              marginRight: 25,
              marginBottom: 25,
              width: 500,
              isReadOnly: isReadOnly,
            ),
            MaterialTextField(
              isPassword: false,
              controller: usernameController,
              labelText: "Username",
              marginLeft: 25,
              marginRight: 25,
              marginBottom: 25,
              width: 500,
              isReadOnly: isReadOnly,
            ),
            MaterialTextField(
              isPassword: true,
              controller: passwordController,
              labelText: "Password",
              marginLeft: 25,
              marginRight: 25,
              width: 500,
              isReadOnly: isReadOnly,
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
              isReadOnly: isReadOnly,
            ),

            // Add your password editing widgets here
          ],
        ),
      ),
    );
  }
}
