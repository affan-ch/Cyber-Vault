import 'dart:convert';
import 'package:cyber_vault/models/hashing.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<http.Response> fetchSaltByEmail(String email) async {
  final url = Uri.parse('http://localhost:3000/api/getSaltByEmail/');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'email': email});

  final response = await http.post(url, headers: headers, body: body);

  return response;
}

Future<http.Response> login(String email, String password) async {
  dynamic salt = await fetchSaltByEmail(email);

  salt = jsonDecode(salt.body)['salt'];
  salt = Uint8List.fromList(salt.cast<int>());

  var hashedPassword = hashPassword(password, salt);

  if (kDebugMode) {
    print('Hashed password: $hashedPassword');
  }

  final url = Uri.parse('http://localhost:3000/api/login');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'email': email, 'password': hashedPassword});

  final response = await http.post(url, headers: headers, body: body);

  return response;
}
