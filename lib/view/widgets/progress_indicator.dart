import 'package:eth_ride/concern/common.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorDialog extends StatelessWidget {
  final String message;
  ProgressIndicatorDialog({required this.message});
  @override
  Widget build(BuildContext context) {
    final CommonMethods commonMethods = CommonMethods(context: context);
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(CommonMethods.primaryColor),
            ),
            SizedBox(width: commonMethods.getWidth() * 0.05),
            Text(
              message,
              style: TextStyle(color: CommonMethods.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
