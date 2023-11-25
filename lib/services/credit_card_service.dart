import 'dart:convert';
import 'package:cyber_vault/models/credit_card.dart';
import 'package:http/http.dart' as http;
import 'package:cyber_vault/services/local_session.dart';

// addCreditCard
Future<http.Response> addCreditCard(
  String cardTitle,
  String cardHolderName,
  String cardNumber,
  String cardCVV,
  String cardPin,
  String cardExpiryDate,
  String note,
) async {
  String token = await getTokenFromDb();

  if (token.isEmpty) {
    return http.Response.bytes([], 500);
  }

  String cardExpiryMonth = cardExpiryDate.substring(0, 2);
  String cardExpiryYear = cardExpiryDate.substring(3, 5);

  final url = Uri.parse('http://localhost:3000/api/addCreditCard');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({
    'cardTitle': cardTitle,
    'cardHolderName': cardHolderName,
    'cardNumber': cardNumber,
    'cardPin': cardPin,
    'cardExpiryMonth': cardExpiryMonth,
    'cardExpiryYear': cardExpiryYear,
    'cardCVV': cardCVV,
    'note': note,
    'token': token
  });

  final response = await http.post(url, headers: headers, body: body);

  return response;
}

// updateCreditCard
Future<http.Response> updateCreditCard(
  String cardTitle,
  String cardHolderName,
  String cardNumber,
  String cardCVV,
  String cardPin,
  String cardExpiryDate,
  String note,
  String cardId,
) async {
  String token = await getTokenFromDb();

  if (token.isEmpty) {
    return http.Response.bytes([], 500);
  }

  String cardExpiryMonth = cardExpiryDate.substring(0, 2);
  String cardExpiryYear = cardExpiryDate.substring(3, 5);

  final url = Uri.parse('http://localhost:3000/api/updateCreditCard');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({
    'cardTitle': cardTitle,
    'cardHolderName': cardHolderName,
    'cardNumber': cardNumber,
    'cardPin': cardPin,
    'cardExpiryMonth': cardExpiryMonth,
    'cardExpiryYear': cardExpiryYear,
    'cardCVV': cardCVV,
    'note': note,
    'id': cardId,
    'token': token
  });

  final response = await http.post(url, headers: headers, body: body);

  return response;
}

// deleteCreditCard
Future<http.Response> deleteCreditCard(String cardId) async {
  String token = await getTokenFromDb();

  if (token.isEmpty) {
    return http.Response.bytes([], 500);
  }

  final url = Uri.parse('http://localhost:3000/api/deleteCreditCard');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'id': cardId, 'token': token});

  final response = await http.post(url, headers: headers, body: body);

  return response;
}

// getCreditCards
Future<List<CreditCard>> getCreditCards() async {
  String token = await getTokenFromDb();

  if (token.isEmpty) {
    return [];
  }

  final url = Uri.parse('http://localhost:3000/api/getCreditCards/');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'token': token});

  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((json) => CreditCard.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load data from server');
  }
}
