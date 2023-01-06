// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// models
import 'package:client/models/response_message.dart';
import 'package:client/models/tasks.dart';

// helpers
import 'package:client/helpers/custom_snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

// providers

// constants
import 'package:client/utils/constants.dart';

String serverUrl = kServerBaseURL;

class ProjectService {
  Future<dynamic> createTask(url, body, context) async {
    final prefs = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.parse(serverUrl + url),
      body: body,
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${prefs.get('token')}',
      },
    );

    ResponseMessage res = ResponseMessage.fromJson(
      jsonDecode(response.body),
    );
    customSnackBar(
      context,
      response.statusCode == 201 ? Colors.green : Colors.red,
      res.message,
    );
    print(res.message);
  }
}
