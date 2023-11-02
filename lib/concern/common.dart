import 'package:flutter/material.dart';

class CommonMethods {
  const CommonMethods({required this.context});
  final BuildContext context;
  static Color get primaryColor => const Color.fromRGBO(5, 182, 252, 100);
  double getHeight() {
    return MediaQuery.of(context).size.height;
  }

  double getWidth() {
    return MediaQuery.of(context).size.width;
  }

  showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            message,
            style: const TextStyle(fontSize: 14),
          ),
        ),
        backgroundColor: primaryColor,
      ),
    );
  }
}
