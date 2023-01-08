// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// models
import 'package:client/models/token.dart';
import 'package:client/models/response_message.dart';

// helpers
import 'package:client/helpers/custom_snackbar.dart';

// constants
import 'package:client/utils/constants.dart';

String serverUrl = kServerBaseURL;

class AuthService {
  Future<dynamic> login(url, body, context) async {
    final prefs = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.parse(serverUrl + url),
      body: body,
    );

    if (response.statusCode == 200) {
      Token loginInfo = Token.fromJson(jsonDecode(response.body));
      prefs.setString('token', loginInfo.data ?? '');
      print(loginInfo.message);
    } else {
      ResponseMessage error = ResponseMessage.fromJson(
        jsonDecode(response.body),
      );
      customSnackBar(context, Colors.red, error.message);
      print(error.message);
    }
  }

  Future<dynamic> register(url, body, context) async {
    final response = await http.post(
      Uri.parse(serverUrl + url),
      body: body,
    );

    if (response.statusCode == 201) {
      ResponseMessage res = ResponseMessage.fromJson(
        jsonDecode(response.body),
      );
      customSnackBar(context, Colors.green, res.message);
      print(res.message);
    } else {
      ResponseMessage error = ResponseMessage.fromJson(
        jsonDecode(response.body),
      );
      customSnackBar(context, Colors.red, error.message);
      print(error.message);
    }
  }
}
