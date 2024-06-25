
import 'package:flutter/material.dart';

class AppFunctions {

  static Future<void> unfocusAllFields(BuildContext? context) async {
    if (context == null) return;
    FocusScope.of(context).unfocus();
  }
}
