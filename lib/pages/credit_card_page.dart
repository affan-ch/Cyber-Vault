import 'package:cyber_vault/models/credit_card.dart';
import 'package:cyber_vault/pages/edit_credit_card_page.dart';
import 'package:cyber_vault/services/credit_card_service.dart';
import 'package:flutter/material.dart';

class CreditCardPage extends StatefulWidget {
  const CreditCardPage({super.key});

  @override
  State<CreditCardPage> createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  late Future<List<CreditCard>> creditCards;

  @override
  void initState() {
    super.initState();
    creditCards = getCreditCards();
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
                  leading: const Icon(Icons.credit_card_rounded),
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
