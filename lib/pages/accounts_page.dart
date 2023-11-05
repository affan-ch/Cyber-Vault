// ignore_for_file: library_private_types_in_public_api

import 'package:cyber_vault/pages/edit_account_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cyber_vault/models/local_session.dart';

class Account {
  final String id;
  final String accountDomain;
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final String password;
  final String phoneNumber;

  Account(this.id, this.accountDomain, this.firstName, this.lastName,
      this.email, this.username, this.password, this.phoneNumber);

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
        json['id'] ?? "",
        json['accountDomain'] ?? "No Domain",
        json['firstName'] ?? "",
        json['lastName'] ?? "",
        json['email'] ?? "",
        json['username'] ?? "",
        json['password'] ?? "",
        json['phoneNumber'] ?? "");
  }
}

class AccountsPage extends StatefulWidget {
  const AccountsPage({super.key});

  @override
  _AccountsPageState createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  late Future<List<Account>> accounts;

  Future<List<Account>> fetchData() async {
    String token = await getTokenFromDb();

    print("Token: $token");

    if (token.isEmpty) {
      return [];
    }

    final url = Uri.parse('http://localhost:3000/api/getAccounts/');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'token': token});

    final response = await http.post(url, headers: headers, body: body);
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Account.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data from server');
    }
  }

  @override
  void initState() {
    super.initState();
    accounts = fetchData();
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
