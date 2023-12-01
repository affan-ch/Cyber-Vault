import 'dart:convert';
import 'package:cyber_vault/models/personal_info.dart';
import 'package:http/http.dart' as http;
import 'package:cyber_vault/services/local_session.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// addPersonalInfo() function is used to add personal information of the user
Future<http.Response> addPersonalInfo(
    String firstName,
    String middleName,
    String lastName,
    String fullName,
    String gender,
    String dateOfBirth,
    String cnic,
    String maritalStatus,
    String religion,
    String nationality,
    String education,
    String occupation,
    String fatherName,
    String fatherCnic,
    String motherName,
    String motherCnic,
    String spouseName,
    String spouseCnic,
    String email,
    String phoneNumber,
    String address,
    String city,
    String state,
    String zipCode,
    String country,
    String recordTitle) async {
  String token = await getTokenFromDb();

  if (token.isEmpty) {
    return http.Response.bytes([], 500);
  }

  dynamic domain = dotenv.env['DOMAIN'];

  final url = Uri.parse('$domain/api/addPersonalInfo');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({
    'firstName': firstName,
    'middleName': middleName,
    'lastName': lastName,
    'fullName': fullName,
    'gender': gender,
    'dateOfBirth': dateOfBirth,
    'cnic': cnic,
    'maritalStatus': maritalStatus,
    'religion': religion,
    'nationality': nationality,
    'education': education,
    'occupation': occupation,
    'fatherName': fatherName,
    'fatherCnic': fatherCnic,
    'motherName': motherName,
    'motherCnic': motherCnic,
    'spouseName': spouseName,
    'spouseCnic': spouseCnic,
    'email': email,
    'phoneNumber': phoneNumber,
    'address': address,
    'city': city,
    'state': state,
    'zipCode': zipCode,
    'country': country,
    'recordTitle': recordTitle,
    'token': token
  });

  final response = await http.post(url, headers: headers, body: body);

  return response;
}

// getPersonalInfo() function is used to get all personal information records of a user
Future<List<PersonalInfo>> getPersonalInfos() async {
  String token = await getTokenFromDb();

  if (token.isEmpty) {
    return [];
  }

  dynamic domain = dotenv.env['DOMAIN'];

  final url = Uri.parse('$domain/api/getPersonalInfos');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'token': token});

  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((json) => PersonalInfo.fromJson(json)).toList();
  } else if (response.statusCode == 403) {
    return [];
  } else {
    throw Exception('Failed to load data from server');
  }
}

// updatePersonalInfo() function is used to update personal information record of a user
Future<http.Response> updatePersonalInfo(
    String id,
    String firstName,
    String middleName,
    String lastName,
    String fullName,
    String gender,
    String dateOfBirth,
    String cnic,
    String maritalStatus,
    String religion,
    String nationality,
    String education,
    String occupation,
    String fatherName,
    String fatherCnic,
    String motherName,
    String motherCnic,
    String spouseName,
    String spouseCnic,
    String email,
    String phoneNumber,
    String address,
    String city,
    String state,
    String zipCode,
    String country,
    String recordTitle) async {
  String token = await getTokenFromDb();

  if (token.isEmpty) {
    return http.Response.bytes([], 500);
  }

  dynamic domain = dotenv.env['DOMAIN'];
  final url = Uri.parse('$domain/api/updatePersonalInfo');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({
    'id': id,
    'firstName': firstName,
    'middleName': middleName,
    'lastName': lastName,
    'fullName': fullName,
    'gender': gender,
    'dateOfBirth': dateOfBirth,
    'cnic': cnic,
    'maritalStatus': maritalStatus,
    'religion': religion,
    'nationality': nationality,
    'education': education,
    'occupation': occupation,
    'fatherName': fatherName,
    'fatherCnic': fatherCnic,
    'motherName': motherName,
    'motherCnic': motherCnic,
    'spouseName': spouseName,
    'spouseCnic': spouseCnic,
    'email': email,
    'phoneNumber': phoneNumber,
    'address': address,
    'city': city,
    'state': state,
    'zipCode': zipCode,
    'country': country,
    'recordTitle': recordTitle,
    'token': token
  });

  final response = await http.post(url, headers: headers, body: body);

  return response;
}

// deletePersonalInfo() function is used to delete personal information record of a user
Future<http.Response> deletePersonalInfo(String id) async {
  String token = await getTokenFromDb();

  if (token.isEmpty) {
    return http.Response.bytes([], 500);
  }
  dynamic domain = dotenv.env['DOMAIN'];
  final url = Uri.parse('$domain/api/deletePersonalInfo');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'id': id, 'token': token});

  final response = await http.post(url, headers: headers, body: body);

  return response;
}
