import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> addPassword(String name, String email, String username,
    String password, String title) async {
  final url = Uri.parse('http://localhost:3000/api/add-password');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({
    'name': name,
    'email': email,
    'username': username,
    'password': password,
    'title': title
  });

  final response = await http.post(url, headers: headers, body: body);

  return response;
}
