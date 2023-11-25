import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> validateToken(String token) async {
  final url = Uri.parse('http://localhost:3000/api/validateToken');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({
    'token': token,
  });

  final response = await http.post(url, headers: headers, body: body);

  return response;
}
