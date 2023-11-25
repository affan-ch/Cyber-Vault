// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:cyber_vault/models/account.dart';
import 'package:cyber_vault/pages/edit_account_page.dart';
import 'package:cyber_vault/services/account_service.dart';
import 'package:flutter/material.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({super.key});

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  late Future<List<Account>> accounts;

  @override
  void initState() {
    super.initState();
    accounts = getAccounts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null,
      ),
      body: FutureBuilder<List<Account>>(
        future: accounts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text("No accounts found"),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Account account = snapshot.data![index];
                return Card(
                    child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditAccountPage(account: account),
                      ),
                    );
                  },
                  leading: const Icon(Icons.vpn_key),
                  title: Text(account.accountDomain),
                  subtitle: Text(account.email),
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
          Navigator.pushNamed(context, '/add_account');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
