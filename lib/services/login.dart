import 'dart:convert';
import 'package:cyber_vault/services/hashing.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<http.Response> fetchSaltByEmail(String email) async {
  dynamic domain = dotenv.env['DOMAIN'];
  final url = Uri.parse('$domain/api/getSaltByEmail/');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'email': email});

  final response = await http.post(url, headers: headers, body: body);

  return response;
}

Future<http.Response> login(String email, String password) async {
  dynamic salt = await fetchSaltByEmail(email);

  salt = jsonDecode(salt.body);

  List<String> saltValues = salt
      .toString()
      .replaceAll("[", "")
      .replaceAll("]", "")
      .split(",")
      .map((e) => e.trim())
      .toList();

  List<int> saltIntegers = saltValues.map(int.parse).toList();

  salt = Uint8List.fromList(saltIntegers);

  var hashedPassword = hashPassword(password, salt);

  dynamic domain = dotenv.env['DOMAIN'];
  final url = Uri.parse('$domain/api/login');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'email': email, 'password': hashedPassword});

  final response = await http.post(url, headers: headers, body: body);

  return response;
}
