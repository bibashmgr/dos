// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

// models
import 'package:client/models/response_message.dart';
import 'package:client/models/user.dart';

// helpers
import 'package:client/helpers/custom_snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

// providers
import 'package:client/providers/user_provider.dart';

// constants
import 'package:client/utils/constants.dart';

String serverUrl = kServerBaseURL;

class ProfileService {
  Future<dynamic> getProfile(url, context) async {
    final prefs = await SharedPreferences.getInstance();
    final response = await http.get(
      Uri.parse(serverUrl + url),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${prefs.get('token')}',
      },
    );

    if (response.statusCode == 200) {
      User user = User.fromJson(jsonDecode(response.body));

      Provider.of<UserProvider>(
        context,
        listen: false,
      ).setUser(user.data);
    } else {
      ResponseMessage error = ResponseMessage.fromJson(
        jsonDecode(response.body),
      );
      customSnackBar(context, Colors.red, error.message);
      print(error.message);
    }
  }
}
