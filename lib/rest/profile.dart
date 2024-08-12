import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/userInfos.dart';
import 'package:flutter_application_1/rest/rest_api.dart';
import 'package:http/http.dart' as http;

class ProfileApi {
  static ProfileModel? profile;
  static Future<ProfileModel?> getProfileDetails() async {
    final url = Uri.parse(
        'http://10.0.2.2:3009/api/v1/users/profile'); // Replace with your API endpoint
    final String token = ApiService.token;
    print(' token from request: $token');
    try {
      final response =
          await http.get(url, headers: {"Authorization": "Bearer $token"});

      if (response.statusCode == 200) {
        print(response.body);
        return ProfileModel.fromJson(response.body);
      } else {
        print('Failed to load profile details: ${response.statusCode}');
        return null;
      }
    } catch (e, stackTrace) {
      print('Error fetching profile details: $e');
      print(stackTrace);
      return null;
    }
  }

  static Future<bool> updateProfile(String userId, ProfileModel profile) async {
    final url = Uri.parse(
        'http://10.0.2.2:3009/api/v1/users/profile-update-v1/$userId'); // Replace with your API endpoint
    final String token = ApiService.token;
    print('Token from request: $token');
    try {
      final response = await http.patch(
        url,
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json"
        },
        body: profile.toJson(),
      );

      if (response.statusCode == 200) {
        print('Profile updated successfully');
        return true;
      } else {
        print('Failed to update profile: ${response.statusCode}');
        return false;
      }
    } catch (e, stackTrace) {
      print('Error updating profile: $e');
      print(stackTrace);
      return false;
    }
  }

  static Future<bool> updateProfilePassword(
      String userId, String oldPassword, String newPassword) async {
    final url = Uri.parse(
        'http://10.0.2.2:3009/api/v1/users/profile-update-v1/$userId'); // Replace with your API endpoint
    final String token = ApiService.token;
    print('Token from request: $token');
    try {
      final body = {
        "old_password": oldPassword,
        "new_password": newPassword,
      };
      final response = await http.put(
        url,
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json"
        },
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        print('Profile updated successfully');
        return true;
      } else {
        print('Failed to update profile: ${response.statusCode}');
        return false;
      }
    } catch (e, stackTrace) {
      print('Error updating profile: $e');
      print(stackTrace);
      return false;
    }
  }
}
