// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'package:cyber_vault/pages/edit_credit_card_page.dart';
import 'package:http/http.dart' as http;
import 'package:cyber_vault/models/local_session.dart';
import 'package:flutter/material.dart';

class CreditCard {
  final String id;
  final String userId;
  final String cardTitle;
  final String cardHolderName;
  final String cardNumber;
  final String cardPin;
  final String cardExpiryMonth;
  final String cardExpiryYear;
  final String cardCVV;
  final String note;

  CreditCard(
      this.id,
      this.userId,
      this.cardTitle,
      this.cardHolderName,
      this.cardNumber,
      this.cardPin,
      this.cardExpiryMonth,
      this.cardExpiryYear,
      this.cardCVV,
      this.note);

  factory CreditCard.fromJson(Map<String, dynamic> json) {
    return CreditCard(
        json['id'] ?? "",
        json['userId'] ?? "",
        json['cardTitle'] ?? "",
        json['cardHolderName'] ?? "",
        json['cardNumber'] ?? "",
        json['cardPin'] ?? "",
        json['cardExpiryMonth'] ?? "",
        json['cardExpiryYear'] ?? "",
        json['cardCVV'] ?? "",
        json['note'] ?? "");
  }
}

class CreditCardPage extends StatefulWidget {
  const CreditCardPage({super.key});

  @override
  _CreditCardPageState createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  late Future<List<CreditCard>> creditCards;

  Future<List<CreditCard>> fetchData() async {
    String token = await getTokenFromDb();

    print("Token: $token");

    if (token.isEmpty) {
      return [];
    }

    final url = Uri.parse('http://localhost:3000/api/getCreditCards/');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'token': token});

    final response = await http.post(url, headers: headers, body: body);
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => CreditCard.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data from server');
    }
  }

  @override
  void initState() {
    super.initState();
    creditCards = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null,
      ),
      body: FutureBuilder<List<CreditCard>>(
        future: creditCards,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text("No Credit Card found"),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                CreditCard creditCard = snapshot.data![index];
                return Card(
                    child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EditCreditCardPage(creditCard: creditCard),
                      ),
                    );
                  },
                  leading: const Icon(Icons.vpn_key),
                  title: Text(creditCard.cardTitle),
                  subtitle: Text(creditCard.cardNumber),
                  trailing: const Icon(Icons.chevron_right),
                  isThreeLine: false,
                ));
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_creditCard');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
