// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:cyber_vault/services/personal_info_service.dart';
import 'package:cyber_vault/widgets/text_field.dart';
import 'package:flutter/material.dart';

class AddPersonalInfoPage extends StatefulWidget {
  const AddPersonalInfoPage({Key? key}) : super(key: key);

  @override
  _AddPersonalInfoPageState createState() => _AddPersonalInfoPageState();
}

class _AddPersonalInfoPageState extends State<AddPersonalInfoPage> {
  // Name Info
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();

  // Personal Info
  final TextEditingController genderController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController cnicController = TextEditingController();
  final TextEditingController maritalStatusController = TextEditingController();

  // Religion & Nationality
  final TextEditingController religionController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();

  // Education & Occupation
  final TextEditingController educationController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();

  // Family Info
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController fatherCnicController = TextEditingController();
  final TextEditingController motherNameController = TextEditingController();
  final TextEditingController motherCnicController = TextEditingController();
  final TextEditingController spouseNameController = TextEditingController();
  final TextEditingController spouseCnicController = TextEditingController();

  // Contact Info
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  // Regional Info
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  // Save Record
  final TextEditingController recordTitleController = TextEditingController();

  int _currentStep = 0;

  _addPersonalInfo() async {
    String firstName = firstNameController.text;
    String middleName = middleNameController.text;
    String lastName = lastNameController.text;
    String fullName = fullNameController.text;
    String gender = genderController.text;
    String dateOfBirth = dateOfBirthController.text;
    String cnic = cnicController.text;
    String maritalStatus = maritalStatusController.text;
    String religion = religionController.text;
    String nationality = nationalityController.text;
    String education = educationController.text;
    String occupation = occupationController.text;
    String fatherName = fatherNameController.text;
    String fatherCnic = fatherCnicController.text;
    String motherName = motherNameController.text;
    String motherCnic = motherCnicController.text;
    String spouseName = spouseNameController.text;
    String spouseCnic = spouseCnicController.text;
    String email = emailController.text;
    String phoneNumber = phoneNumberController.text;
    String address = addressController.text;
    String city = cityController.text;
    String state = stateController.text;
    String zipCode = zipCodeController.text;
    String country = countryController.text;
    String recordTitle = recordTitleController.text;

    var response = await addPersonalInfo(
        firstName,
        middleName,
        lastName,
        fullName,
        gender,
        dateOfBirth,
        cnic,
        maritalStatus,
        religion,
        nationality,
        education,
        occupation,
        fatherName,
        fatherCnic,
        motherName,
        motherCnic,
        spouseName,
        spouseCnic,
        email,
        phoneNumber,
        address,
        city,
        state,
        zipCode,
        country,
        recordTitle);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Record Added Successfully'),
        ),
      );
      Navigator.pushNamedAndRemoveUntil(
          context, '/personalInfo', (Route<dynamic> route) => false);
    } else if (response.statusCode == 403) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/login', (Route<dynamic> route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error adding personal info record'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add New Personal Info Record"),
        ),
        body: SingleChildScrollView(
          child: Stepper(
            currentStep: _currentStep,
            onStepContinue: () {
              if (_currentStep == 7) {
                _addPersonalInfo();
              } else {
                setState(() {
                  _currentStep += 1;
                });
              }
            },
            onStepCancel: () {
              _currentStep > 0
                  ? setState(() {
                      _currentStep -= 1;
                    })
                  : null;
            },
            steps: [
              Step(
                  isActive: _currentStep >= 0,
                  title: const Text("Name Info"),
                  content: Column(children: <Widget>[
                    MaterialTextField(
                      isPassword: false,
                      controller: firstNameController,
                      labelText: "First Name",
                      marginTop: 5,
                      marginLeft: 10,
                      marginRight: 10,
                      marginBottom: 15,
                      width: 500,
                    ),
                    MaterialTextField(
                      isPassword: false,
                      controller: middleNameController,
                      labelText: "Middle Name",
                      marginLeft: 10,
                      marginRight: 10,
                      marginBottom: 15,
                      width: 500,
                    ),
                    MaterialTextField(
                      isPassword: false,
                      controller: lastNameController,
                      labelText: "Last Name",
                      marginLeft: 10,
                      marginRight: 10,
                      marginBottom: 15,
                      width: 500,
                    ),
                    MaterialTextField(
                      isPassword: false,
                      controller: fullNameController,
                      labelText: "Full Name",
                      marginLeft: 10,
                      marginRight: 10,
                      marginBottom: 10,
                      width: 500,
                    ),
                  ])),
              Step(
                  isActive: _currentStep >= 1,
                  title: const Text("Personal Info"),
                  content: Column(
                    children: <Widget>[
                      MaterialTextField(
                        isPassword: false,
                        controller: genderController,
                        labelText: "Gender",
                        marginTop: 5,
                        marginLeft: 10,
                        marginRight: 10,
                        marginBottom: 10,
                        width: 500,
                      ),
                      MaterialTextField(
                        isPassword: false,
                        controller: dateOfBirthController,
                        labelText: "Date Of Birth",
                        marginTop: 5,
                        marginLeft: 10,
                        marginRight: 10,
                        marginBottom: 10,
                        width: 500,
                      ),
                      MaterialTextField(
                        isPassword: false,
                        controller: cnicController,
                        labelText: "CNIC",
                        marginTop: 5,
                        marginLeft: 10,
                        marginRight: 10,
                        marginBottom: 10,
                        width: 500,
                      ),
                      MaterialTextField(
                        isPassword: false,
                        controller: maritalStatusController,
                        labelText: "Martial Status",
                        marginTop: 5,
                        marginLeft: 10,
                        marginRight: 10,
                        marginBottom: 10,
                        width: 500,
                      ),
                    ],
                  )),
              Step(
                  title: const Text("Religion & Nationality"),
                  isActive: _currentStep >= 2,
                  content: Column(children: <Widget>[
                    MaterialTextField(
                      isPassword: false,
                      controller: religionController,
                      labelText: "Religion",
                      marginTop: 5,
                      marginLeft: 10,
                      marginRight: 10,
                      marginBottom: 10,
                      width: 500,
                    ),
                    MaterialTextField(
                      isPassword: false,
                      controller: nationalityController,
                      labelText: "Nationality",
                      marginTop: 5,
                      marginLeft: 10,
                      marginRight: 10,
                      marginBottom: 10,
                      width: 500,
                    ),
                  ])),
              Step(
                title: const Text("Education & Occupation"),
                isActive: _currentStep >= 3,
                content: Column(
                  children: <Widget>[
                    MaterialTextField(
                      isPassword: false,
                      controller: educationController,
                      labelText: "Education",
                      marginTop: 5,
                      marginLeft: 10,
                      marginRight: 10,
                      marginBottom: 10,
                      width: 500,
                    ),
                    MaterialTextField(
                      isPassword: false,
                      controller: occupationController,
                      labelText: "Occupation",
                      marginTop: 5,
                      marginLeft: 10,
                      marginRight: 10,
                      marginBottom: 10,
                      width: 500,
                    ),
                  ],
                ),
              ),
              Step(
                title: const Text("Family Info"),
                isActive: _currentStep >= 4,
                content: Column(
                  children: <Widget>[
                    MaterialTextField(
                      isPassword: false,
                      controller: fatherNameController,
                      labelText: "Father Name",
                      marginTop: 5,
                      marginLeft: 10,
                      marginRight: 10,
                      marginBottom: 10,
                      width: 500,
                    ),
                    MaterialTextField(
                      isPassword: false,
                      controller: fatherCnicController,
                      labelText: "Father CNIC",
                      marginTop: 5,
                      marginLeft: 10,
                      marginRight: 10,
                      marginBottom: 10,
                      width: 500,
                    ),
                    MaterialTextField(
                      isPassword: false,
                      controller: motherNameController,
                      labelText: "Mother Name",
                      marginTop: 5,
                      marginLeft: 10,
                      marginRight: 10,
                      marginBottom: 10,
                      width: 500,
                    ),
                    MaterialTextField(
                      isPassword: false,
                      controller: motherCnicController,
                      labelText: "Mother CNIC",
                      marginTop: 5,
                      marginLeft: 10,
                      marginRight: 10,
                      marginBottom: 10,
                      width: 500,
                    ),
                    MaterialTextField(
                      isPassword: false,
                      controller: spouseNameController,
                      labelText: "Spouse Name",
                      marginTop: 5,
                      marginLeft: 10,
                      marginRight: 10,
                      marginBottom: 10,
                      width: 500,
                    ),
                    MaterialTextField(
                      isPassword: false,
                      controller: spouseCnicController,
                      labelText: "Spouse CNIC",
                      marginTop: 5,
                      marginLeft: 10,
                      marginRight: 10,
                      marginBottom: 10,
                      width: 500,
                    ),
                  ],
                ),
              ),
              Step(
                title: const Text("Contact Info"),
                isActive: _currentStep >= 5,
                content: Column(
                  children: <Widget>[
                    MaterialTextField(
                      isPassword: false,
                      controller: emailController,
                      labelText: "Email",
                      marginTop: 5,
                      marginLeft: 10,
                      marginRight: 10,
                      marginBottom: 10,
                      width: 500,
                    ),
                    MaterialTextField(
                      isPassword: false,
                      controller: phoneNumberController,
                      labelText: "Phone Number",
                      marginTop: 5,
                      marginLeft: 10,
                      marginRight: 10,
                      marginBottom: 10,
                      width: 500,
                    ),
                  ],
                ),
              ),
              Step(
                title: const Text("Regional Info"),
                isActive: _currentStep >= 6,
                content: Column(
                  children: <Widget>[
                    MaterialTextField(
                      isPassword: false,
                      controller: addressController,
                      labelText: "Address",
                      marginTop: 5,
                      marginLeft: 10,
                      marginRight: 10,
                      marginBottom: 10,
                      width: 500,
                    ),
                    MaterialTextField(
                      isPassword: false,
                      controller: cityController,
                      labelText: "City",
                      marginTop: 5,
                      marginLeft: 10,
                      marginRight: 10,
                      marginBottom: 10,
                      width: 500,
                    ),
                    MaterialTextField(
                      isPassword: false,
                      controller: stateController,
                      labelText: "State",
                      marginTop: 5,
                      marginLeft: 10,
                      marginRight: 10,
                      marginBottom: 10,
                      width: 500,
                    ),
                    MaterialTextField(
                      isPassword: false,
                      controller: zipCodeController,
                      labelText: "Zip Code",
                      marginTop: 5,
                      marginLeft: 10,
                      marginRight: 10,
                      marginBottom: 10,
                      width: 500,
                    ),
                    MaterialTextField(
                      isPassword: false,
                      controller: countryController,
                      labelText: "Country",
                      marginTop: 5,
                      marginLeft: 10,
                      marginRight: 10,
                      marginBottom: 10,
                      width: 500,
                    ),
                  ],
                ),
              ),
              Step(
                title: const Text("Save Record"),
                isActive: _currentStep >= 7,
                content: Column(
                  children: <Widget>[
                    MaterialTextField(
                      isPassword: false,
                      controller: recordTitleController,
                      labelText: "Record Title",
                      marginTop: 5,
                      marginLeft: 10,
                      marginRight: 10,
                      marginBottom: 10,
                      width: 500,
                    )
                  ],
                ),
              )
            ],
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 12, 0, 0),
                  child: Center(
                      child: Row(
                    children: <Widget>[
                      if (_currentStep < 7)
                        FilledButton(
                          onPressed: details.onStepContinue,
                          child: const Text('Next'),
                        ),
                      if (_currentStep == 7)
                        FilledButton(
                          onPressed: details.onStepContinue,
                          child: const Text('Save'),
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
          ),
        ));
  }

  @override
  void dispose() {
    emailController
        .dispose(); // Dispose of the controller to prevent memory leaks
    super.dispose();
  }
}
