// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:cyber_vault/services/account_service.dart';
import 'package:cyber_vault/widgets/text_field.dart';
import 'package:flutter/material.dart';

class EditAccountPage extends StatefulWidget {
  final dynamic account;

  const EditAccountPage({super.key, required this.account});

  @override
  _EditAccountPageState createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  final TextEditingController domainController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  bool isReadOnly = true;
  String accountId = "";
  bool _isButtonVisible = true;

  void toggleReadOnly() {
    setState(() {
      isReadOnly = !isReadOnly;
    });
  }

  void hideActionButtons() {
    setState(() {
      _isButtonVisible =
          !_isButtonVisible; // Toggles the boolean value to show/hide the button
    });
  }

  void _updateRecord() async {
    String domain = domainController.text;
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String email = emailController.text;
    String username = usernameController.text;
    String password = passwordController.text;
    String phoneNumber = phoneNumberController.text;

    var response = await updateAccount(accountId, domain, firstName, lastName,
        email, username, password, phoneNumber);

    print(response.body);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account Updated')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error Updating Account')),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      accountId = widget.account.id;
    });

    domainController.text = widget.account.accountDomain;
    firstNameController.text = widget.account.firstName;
    lastNameController.text = widget.account.lastName;
    emailController.text = widget.account.email;
    usernameController.text = widget.account.username;
    passwordController.text = widget.account.password;
    phoneNumberController.text = widget.account.phoneNumber;
  }

  void _deleteAccount() async {
    var response = await deleteAccount(accountId);

    print(response.body);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account Deleted')),
      );

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error Deleting Account')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Account'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                        child: Visibility(
                          visible: !_isButtonVisible,
                          child: FilledButton.icon(
                            onPressed: () {
                              toggleReadOnly();
                              hideActionButtons();
                              _updateRecord();
                            },
                            label: const Text("Update"),
                            icon: const Icon(Icons.done),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                        child: Visibility(
                          visible: _isButtonVisible,
                          child: FilledButton.icon(
                            onPressed: () {
                              toggleReadOnly();
                              hideActionButtons();
                            },
                            label: const Text("Edit"),
                            icon: const Icon(Icons.edit),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                          child: Visibility(
                              visible: _isButtonVisible,
                              child: FilledButton.icon(
                                  onPressed: () {
                                    _deleteAccount();
                                  },
                                  icon: const Icon(Icons.delete),
                                  label: const Text("Delete"),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Theme.of(context)
                                                .colorScheme
                                                .onSecondary),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                  )))),
                    ])),
            Expanded(
                child: SingleChildScrollView(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialTextField(
                  isPassword: false,
                  controller: domainController,
                  labelText: "Domain",
                  marginTop: 15,
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: firstNameController,
                  labelText: "First Name",
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: lastNameController,
                  labelText: "Last Name",
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
                  controller: phoneNumberController,
                  labelText: "Phone Number",
                  marginTop: 25,
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 40,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
              ],
            )))

            // Add your password editing widgets here
          ],
        ),
      ),
    );
  }
}
