import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cyber_vault/models/local_session.dart';

Future<http.Response> deleteAccount(String accountId) async {
  String token = await getTokenFromDb();

  if (token.isEmpty) {
    return http.Response.bytes([], 500);
  }

  final url = Uri.parse('http://localhost:3000/api/deleteAccount');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'id': accountId, 'token': token});

  final response = await http.post(url, headers: headers, body: body);

  return response;
}
