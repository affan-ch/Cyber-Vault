import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<http.Response> validateToken(String token) async {
  dynamic domain = dotenv.env['DOMAIN'];
  final url = Uri.parse('$domain/api/validateToken');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({
    'token': token,
  });

  final response = await http.post(url, headers: headers, body: body);

  return response;
}
