// ignore_for_file: library_private_types_in_public_api

import 'package:cyber_vault/pages/edit_password_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final String name;
  final String email;
  final String username;
  final String password;
  final String title;

  User(this.name, this.email, this.username, this.password, this.title);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['name'], json['email'], json['username'], json['password'],
        json['title']);
  }
}

class PasswordsPage extends StatefulWidget {
  const PasswordsPage({super.key});

  @override
  _PasswordsPageState createState() => _PasswordsPageState();
}

class _PasswordsPageState extends State<PasswordsPage> {
  late Future<List<User>> users;

  Future<List<User>> fetchData() async {
    final url = Uri.parse('http://localhost:3000/api/get-passwords/');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'email': 'affan@gmail.com'});

    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data from server');
    }
  }

  @override
  void initState() {
    super.initState();
    users = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null,
      ),
      body: FutureBuilder<List<User>>(
        future: users,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                User user = snapshot.data![index];
                return Card(
                    child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditPasswordPage(user: user),
                      ),
                    );
                  },
                  leading: const Icon(Icons.vpn_key),
                  title: Text(user.title),
                  subtitle: Text(user.email),
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
          Navigator.pushNamed(context, '/add_password');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
