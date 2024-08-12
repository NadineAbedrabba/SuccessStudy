import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/rest/profile.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:3009/api/v1/auth';
  static String token = "";
  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // print(response.body);
      // print(json.decode(response.body)["data"]["user"]);
      token = json.decode(response.body)["data"]["token"]["accessToken"];
      print(token);
      return jsonDecode(response.body);
    } else {
      // Handle errors by parsing the response body
      final errorResponse = jsonDecode(response.body);
      final errorMessage =
          errorResponse['message'] ?? 'An unknown error occurred';
      throw Exception(errorMessage);
    }
  }

}
