// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:cyber_vault/services/credit_card_service.dart';
import 'package:cyber_vault/widgets/text_field.dart';
import 'package:flutter/material.dart';

class EditCreditCardPage extends StatefulWidget {
  final dynamic creditCard;

  const EditCreditCardPage({super.key, required this.creditCard});

  @override
  State<EditCreditCardPage> createState() => _EditCreditCardPageState();
}

class _EditCreditCardPageState extends State<EditCreditCardPage> {
  final TextEditingController _cardTitleController = TextEditingController();
  final TextEditingController _cardHolderNameController =
      TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardCVVController = TextEditingController();
  final TextEditingController _cardPinController = TextEditingController();
  final TextEditingController _cardExpiryDateController =
      TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  bool isReadOnly = true;
  String creditCardId = "";
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
    String cardTitle = _cardTitleController.text;
    String cardHolderName = _cardHolderNameController.text;
    String cardNumber = _cardNumberController.text;
    String cardCVV = _cardCVVController.text;
    String cardPin = _cardPinController.text;
    String cardExpiryDate = _cardExpiryDateController.text;
    String note = _noteController.text;

    var response = await updateCreditCard(cardTitle, cardHolderName, cardNumber,
        cardCVV, cardPin, cardExpiryDate, note, creditCardId);

    print(response.body);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Credit Card Updated')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error Updating Credit Card')),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      creditCardId = widget.creditCard.id;
    });

    _cardTitleController.text = widget.creditCard.cardTitle;
    _cardHolderNameController.text = widget.creditCard.cardHolderName;
    _cardNumberController.text = widget.creditCard.cardNumber;
    _cardCVVController.text = widget.creditCard.cardCVV;
    _cardPinController.text = widget.creditCard.cardPin;
    final cardExpiryMonth = widget.creditCard.cardExpiryMonth;
    final cardExpiryYear = widget.creditCard.cardExpiryYear;
    _cardExpiryDateController.text =
        "$cardExpiryMonth/$cardExpiryYear"; // widget.creditCard.cardExpiryDate;
    _noteController.text = widget.creditCard.note;
  }

  void _deleteCreditCard() async {
    var response = await deleteCreditCard(creditCardId);

    print(response.body);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Credit Card Deleted')),
      );

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error Deleting Credit Card')),
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
                                    _deleteCreditCard();
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
                  controller: _cardTitleController,
                  labelText: "Card Title",
                  marginTop: 15,
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: _cardHolderNameController,
                  labelText: "Card Holder Name",
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: _cardNumberController,
                  labelText: "Card Number",
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: _cardCVVController,
                  labelText: "Card CVV",
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: true,
                  controller: _cardPinController,
                  labelText: "Card Pin",
                  marginLeft: 25,
                  marginRight: 25,
                  marginBottom: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: _cardExpiryDateController,
                  labelText: "Card Expiry Date",
                  marginLeft: 25,
                  marginRight: 25,
                  width: 500,
                  isReadOnly: isReadOnly,
                ),
                MaterialTextField(
                  isPassword: false,
                  controller: _noteController,
                  labelText: "Note",
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
