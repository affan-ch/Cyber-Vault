import 'dart:convert';
import 'package:cyber_vault/models/account.dart';
import 'package:http/http.dart' as http;
import 'package:cyber_vault/services/local_session.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// addAccount
Future<http.Response> addAccount(
    String domain,
    String firstName,
    String lastName,
    String email,
    String username,
    String password,
    String phoneNumber) async {
  String token = await getTokenFromDb();

  if (token.isEmpty) {
    return http.Response.bytes([], 500);
  }
  dynamic domain = dotenv.env['DOMAIN'];
  final url = Uri.parse('$domain/api/addAccount');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({
    'accountDomain': domain,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'username': username,
    'password': password,
    'phoneNumber': phoneNumber,
    'token': token
  });

  final response = await http.post(url, headers: headers, body: body);

  return response;
}

// deleteAccount
Future<http.Response> deleteAccount(String accountId) async {
  String token = await getTokenFromDb();

  if (token.isEmpty) {
    return http.Response.bytes([], 500);
  }
  dynamic domain = dotenv.env['DOMAIN'];
  final url = Uri.parse('$domain/api/deleteAccount');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'id': accountId, 'token': token});

  final response = await http.post(url, headers: headers, body: body);

  return response;
}

// updateAccount
Future<http.Response> updateAccount(
    String accountId,
    String domain,
    String firstName,
    String lastName,
    String email,
    String username,
    String password,
    String phoneNumber) async {
  String token = await getTokenFromDb();

  if (token.isEmpty) {
    return http.Response.bytes([], 500);
  }

  dynamic domain = dotenv.env['DOMAIN'];

  final url = Uri.parse('$domain/api/updateAccount');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({
    'id': accountId,
    'accountDomain': domain,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'username': username,
    'password': password,
    'phoneNumber': phoneNumber,
    'token': token
  });

  final response = await http.post(url, headers: headers, body: body);

  return response;
}

// getAccounts
Future<List<Account>> getAccounts() async {
  String token = await getTokenFromDb();

  if (token.isEmpty) {
    return [];
  }
  dynamic domain = dotenv.env['DOMAIN'];
  final url = Uri.parse('$domain/api/getAccounts/');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'token': token});

  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((json) => Account.fromJson(json)).toList();
  } else if (response.statusCode == 403) {
    return [];
  } else {
    throw Exception('Failed to load data from server');
  }
}
