import 'package:flutter/material.dart';

// constants
import 'package:client/utils/constants.dart';

dynamic customSnackBar(context, color, message) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(
        milliseconds: 2500,
      ),
      action: SnackBarAction(
        label: 'Dismiss',
        disabledTextColor: kLightColor,
        textColor: kLightColor,
        onPressed: () {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
        },
      ),
    ),
  );
}
