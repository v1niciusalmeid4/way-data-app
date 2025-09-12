import 'package:flutter/material.dart';
import 'package:morphling/morphling.dart';

mixin HudMixin {
  final BuildContext? context = NavigatorService.key.currentContext;

  void _showSnackBar(
    String message, {
    required Color backgroundColor,
  }) {
    if (context == null) {
      return;
    }

    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }

  void showSuccess(String message) {
    _showSnackBar(
      message,
      backgroundColor: Colors.green,
    );
  }

  void showFailure(String message) {
    _showSnackBar(
      message,
      backgroundColor: Colors.red,
    );
  }

  void showWarning(String message) {
    _showSnackBar(
      message,
      backgroundColor: Colors.orange,
    );
  }
}
