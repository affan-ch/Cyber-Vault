// ignore_for_file: library_private_types_in_public_api

import 'package:cyber_vault/models/credit_card.dart';
import 'package:cyber_vault/widgets/text_field.dart';
import 'package:flutter/material.dart';

class AddCreditCardPage extends StatefulWidget {
  const AddCreditCardPage({Key? key}) : super(key: key);

  @override
  _AddCreditCardPageState createState() => _AddCreditCardPageState();
}

class _AddCreditCardPageState extends State<AddCreditCardPage> {
  // controller
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _cardHolderNameController =
      TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardCVVController = TextEditingController();
  final TextEditingController _cardPinController = TextEditingController();
  final TextEditingController _cardExpireDateController =
      TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  _addCreditCard() async {
    String title = _titleController.text;
    String cardHolderName = _cardHolderNameController.text;
    String cardNumber = _cardNumberController.text;
    String cardCVV = _cardCVVController.text;
    String cardPin = _cardPinController.text;
    String cardExpireDate = _cardExpireDateController.text;
    String note = _noteController.text;

    var response = await addCreditCard(title, cardHolderName, cardNumber,
        cardCVV, cardPin, cardExpireDate, note);

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Credit Card"),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            MaterialTextField(
              isPassword: false,
              controller: _titleController,
              labelText: "Title",
              marginTop: 15,
              marginLeft: 25,
              marginRight: 25,
              marginBottom: 25,
              width: 500,
            ),
            MaterialTextField(
              isPassword: false,
              controller: _cardHolderNameController,
              labelText: "Card Holder Name",
              marginLeft: 25,
              marginRight: 25,
              marginBottom: 25,
              width: 500,
            ),
            MaterialTextField(
              isPassword: false,
              controller: _cardNumberController,
              labelText: "Card Number",
              marginLeft: 25,
              marginRight: 25,
              marginBottom: 25,
              width: 500,
            ),
            MaterialTextField(
              isPassword: false,
              controller: _cardCVVController,
              labelText: "Card CVV",
              marginLeft: 25,
              marginRight: 25,
              marginBottom: 25,
              width: 500,
            ),
            MaterialTextField(
              isPassword: true,
              controller: _cardPinController,
              labelText: "Card Pin",
              marginLeft: 25,
              marginRight: 25,
              marginBottom: 25,
              width: 500,
            ),
            MaterialTextField(
              isPassword: false,
              controller: _cardExpireDateController,
              labelText: "Card Expiry Date",
              hintText: "MM/YY",
              marginLeft: 25,
              marginRight: 25,
              width: 500,
            ),
            MaterialTextField(
              isPassword: false,
              controller: _noteController,
              labelText: "Note",
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
                      dynamic response = await _addCreditCard();
                      print(response.body);
                      if (response.statusCode == 200) {
                        Navigator.pop(context);
                      } else {}
                    },
                    child: const Text("Add Credit Card")))
          ],
        )),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _cardHolderNameController.dispose();
    _cardNumberController.dispose();
    _cardCVVController.dispose();
    _cardPinController.dispose();
    _cardExpireDateController.dispose();
    _noteController.dispose();
  }
}
