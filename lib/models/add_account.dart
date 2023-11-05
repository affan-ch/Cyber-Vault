import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cyber_vault/models/local_session.dart';

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

  final url = Uri.parse('http://localhost:3000/api/addAccount');
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
