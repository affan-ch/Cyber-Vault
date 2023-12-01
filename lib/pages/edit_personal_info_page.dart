// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:cyber_vault/models/personal_info.dart';
import 'package:cyber_vault/services/personal_info_service.dart';
import 'package:cyber_vault/widgets/text_field.dart';
import 'package:flutter/material.dart';

class EditPersonalInfoPage extends StatefulWidget {
  final PersonalInfo personalInfo;

  const EditPersonalInfoPage({super.key, required this.personalInfo});

  @override
  State<EditPersonalInfoPage> createState() => _EditPersonalInfoPageState();
}

class _EditPersonalInfoPageState extends State<EditPersonalInfoPage> {
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

  bool isReadOnly = true;
  String personalInfoId = "";
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

  _updateRecord() async {
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

    var response = await updatePersonalInfo(
        personalInfoId,
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

    print(response.body);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Personal Info Updated')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error Updating Personal Info')),
      );
    }
  }

  _deleteRecord() async {
    var response = await deletePersonalInfo(personalInfoId);

    print(response.body);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Personal Info Deleted')),
      );

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error Deleting Personal Info')),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      personalInfoId = widget.personalInfo.id;
    });

    recordTitleController.text = widget.personalInfo.recordTitle;
    firstNameController.text = widget.personalInfo.firstName;
    middleNameController.text = widget.personalInfo.middleName;
    lastNameController.text = widget.personalInfo.lastName;
    fullNameController.text = widget.personalInfo.fullName;
    genderController.text = widget.personalInfo.gender;
    dateOfBirthController.text = widget.personalInfo.dateOfBirth;
    cnicController.text = widget.personalInfo.cnic;
    maritalStatusController.text = widget.personalInfo.maritalStatus;
    religionController.text = widget.personalInfo.religion;
    nationalityController.text = widget.personalInfo.nationality;
    educationController.text = widget.personalInfo.education;
    occupationController.text = widget.personalInfo.occupation;
    fatherNameController.text = widget.personalInfo.fatherName;
    fatherCnicController.text = widget.personalInfo.fatherCnic;
    motherNameController.text = widget.personalInfo.motherName;
    motherCnicController.text = widget.personalInfo.motherCnic;
    spouseNameController.text = widget.personalInfo.spouseName;
    spouseCnicController.text = widget.personalInfo.spouseCnic;
    emailController.text = widget.personalInfo.email;
    phoneNumberController.text = widget.personalInfo.phoneNumber;
    addressController.text = widget.personalInfo.address;
    cityController.text = widget.personalInfo.city;
    stateController.text = widget.personalInfo.state;
    zipCodeController.text = widget.personalInfo.zipCode;
    countryController.text = widget.personalInfo.country;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Personal Info Record'),
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
                                    _deleteRecord();
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
                  controller: recordTitleController,
                  labelText: "Record Title",
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
                  controller: middleNameController,
                  labelText: "Middle Name",
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
                  controller: fullNameController,
                  labelText: "Full Name",
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: genderController,
                  labelText: "Gender",
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: dateOfBirthController,
                  labelText: "Date Of Birth",
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: cnicController,
                  labelText: "CNIC Number",
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: maritalStatusController,
                  labelText: "Marital Status",
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: religionController,
                  labelText: "Religion",
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: nationalityController,
                  labelText: "Nationality",
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: educationController,
                  labelText: "Education",
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: occupationController,
                  labelText: "Occupation",
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: fatherNameController,
                  labelText: "Father Name",
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: fatherCnicController,
                  labelText: "Father CNIC Number",
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: motherNameController,
                  labelText: "Mother Name",
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: motherCnicController,
                  labelText: "Mother CNIC Number",
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: spouseNameController,
                  labelText: "Spouse Name",
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: spouseCnicController,
                  labelText: "Spouse CNIC Number",
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: emailController,
                  labelText: "Email Address",
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: phoneNumberController,
                  labelText: "Phone Number",
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: addressController,
                  labelText: "Address",
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: cityController,
                  labelText: "City",
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: stateController,
                  labelText: "State/Province/Region",
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: zipCodeController,
                  labelText: "Zip Code/Postal Code",
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: countryController,
                  labelText: "Country",
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
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
