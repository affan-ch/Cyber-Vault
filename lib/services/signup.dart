import 'dart:convert';
import 'package:argon2/argon2.dart';
import 'package:cyber_vault/services/hashing.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<http.Response> signUp(String firstName, String lastName, String email,
    String phone, String username, String password) async {
  var salt = generateSalt().toBytesLatin1();

  var hashedPassword = hashPassword(password, salt);

  if (kDebugMode) {
    print('Hashed password: $hashedPassword');
  }
  dynamic domain = dotenv.env['DOMAIN'];

  final url = Uri.parse('$domain/api/signup');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'phone': phone,
    'username': username,
    'password': hashedPassword,
    'salt': salt
  });

  final response = await http.post(url, headers: headers, body: body);

  return response;
}
